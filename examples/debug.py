# https://neo4j.com/developer/python/

# python --version

# 3.8
# 3.7
# 3.6
# 3.5

# python -m pip install --upgrade pip

# python -m pip install neo4j==1.7.6


# Client Application
#
# Teminology:
# https://neo4j.com/docs/driver-manual/1.7/terminology/
#
# Client Applications:
# https://neo4j.com/docs/driver-manual/1.7/client-applications/
#
# Python Driver Documentation:
# https://neo4j.com/docs/api/python-driver/1.7/index.html#api-documentation

import neo4j
import argparse

# https://neo4j.com/docs/status-codes/3.5/
from neo4j.exceptions import (
    ProtocolError,
    ServiceUnavailable,
    IncompleteCommitError,
    ConnectionExpired,
    SecurityError,
    CypherError,
    ClientError,                        # effect on transaction: Rollback
    DatabaseError,                      # effect on transaction: Rollback
    TransientError,                     # effect on transaction: Rollback
    DatabaseUnavailableError,
    ConstraintError,
    CypherSyntaxError,
    CypherTypeError,
    NotALeaderError,
    Forbidden,
    ForbiddenOnReadOnlyDatabaseError,
    AuthError,
)

#from neo4j import GraphDatabase

beer_types = [
    {"name": "ale"},
    {"name": "lager"},
    {"name": "malt"},
    {"name": "stout"},
]

beer_tags = [
    {"name": "amber"},
    {"name": "blonde"},
    {"name": "brown"},
    {"name": "cream"},
    {"name": "dark"},
    {"name": "pale"},
    {"name": "strong"},
    {"name": "wheat"},
    {"name": "red"},
    {"name": "cream"},
    {"name": "pale"},
    {"name": "india"},
    {"name": "european"},
    {"name": "american"},
    {"name": "japanese"},
    {"name": "lime"},
    {"name": "pilsner"},
    {"name": "golden"},
    {"name": "fruit"},
    {"name": "honey"},
    {"name": "bitter"},
    {"name": "dunkel"},
    {"name": "belgian"},
    {"name": "french"},
    {"name": "irish"},
    {"name": "herb"},
    {"name": "spiced"},
    {"name": "porter"},
    {"name": "kellerbier"},
    {"name": "sour"},
    {"name": "cask"},
    {"name": "wheat"},
    {"name": "swedish"},
]

beers = [
    {
        "name": "falcon",
        "type": "lager",
        "tags": ["pilsner", "swedish"],
    },
]


class App():
    '''
    Driver instance in order to provide access to the database

    https://neo4j.com/docs/api/python-driver/current/driver.html
    '''

    max_connection_lifetime = 30 * 60
    max_connection_pool_size = 50
    connection_acquisition_timeout = 2 * 60

    connection_timeout = 15
    max_retry_time = 15

    def __init__(self, uri, user, password):
        self._driver = neo4j.GraphDatabase.driver(
            uri,
            auth=(user, password),
        )

    def close(self):
        self._driver.close()


    @staticmethod
    def _create_beer_type(tx, name):

        cypher = [
            "MERGE (x:Type {name: $name})",
        ]

        result = tx.run(" ".join(cypher), name=name)

        return result.single()


    @staticmethod
    def _create_tag(tx, name):

        cypher = [
            "MERGE (x:Tag {name: $name})",
        ]

        result = tx.run(" ".join(cypher), name=name)

        return result.single()


    @staticmethod
    def _create_tags(tx, tags):

        cypher_1 = [
            "WITH $tags AS tags",
            "UNWIND tags as tag",
            "WITH DISTINCT tag",
            "MERGE (:Tag {name: tag})",
        ]

        cypher_2 = [
            "UNWIND $tags AS tag",
            "WITH DISTINCT tag",
            "MERGE (:Tag {name: tag})",
        ]

        cypher_3 = [
            "WITH $tags AS tags",
            "FOREACH (tag IN tags | MERGE (:Type {name: tag}))",
        ]

        result = tx.run(" ".join(cypher_2), tags=tags)

        return result.single()


    @staticmethod
    def _create_beer(tx, name, beer_type, tags):

        cypher = [
            "MATCH (x:Type {name: $beer_type})",
            "MERGE (b:Beer {name: $name})-[:Relation]->(x)",
            "WITH b AS beer",
            "UNWIND $tags as tag",
            "MERGE (beer)-[:Relation]->(:Tag {name:tag})",
        ]

        result = tx.run(" ".join(cypher), name=name, beer_type=beer_type, tags=tags)

        return result.single()


    @staticmethod
    def _drop(tx):

        cypher = [
            "MATCH (n)",
            "DETACH DELETE n",
        ]

        result = tx.run(" ".join(cypher))

        return result.single()


    @staticmethod
    def _create_index(tx, name):

        # DROP INDEX ON :Person(name)

        cypher = "CREATE INDEX ON :{name}(name)".format(name=name)

        result = tx.run(cypher)

        return result.single()


    @staticmethod
    def _delete_node(tx, node_id):

        cypher = [
            "MATCH (x) WHERE ID(x) = $node_id",
            "DETACH DELETE (x)",
        ]

        result = tx.run(" ".join(cypher), node_id=node_id)

        return result.single()


    @staticmethod
    def _get_all(tx):

        cypher ="MATCH (x) RETURN (x)"

        result = tx.run(cypher)

        return result


    def create_beer_type(self, name):
        result = None

        with self._driver.session() as session:
            result = session.write_transaction(self._create_beer_type, name)

        return result


    def create_tag(self, name):
        result = None

        with self._driver.session() as session:
            result = session.write_transaction(self._create_tag, name)

        return result


    def create_tags(self, tags):
        result = None

        with self._driver.session() as session:
            result = session.write_transaction(self._create_tags, tags)

        return result

    def create_beer(self, name, beer_type, tags):
        result = None

        with self._driver.session() as session:
            result = session.write_transaction(self._create_beer, name, beer_type, tags)

        return result


    def drop(self):
        result = None

        with self._driver.session() as session:
                result = session.write_transaction(self._drop)

        return result


    def create_indexes(self):
        result = None

        with self._driver.session() as session:
            tx = session.begin_transaction()
            self._create_index(tx, "Type")
            self._create_index(tx, "Tag")
            self._create_index(tx, "Beer")
            tx.commit()

            #result = session.write_transaction(self._create_indexes)

        return result


    def delete_node(self, node_id):
        result = None

        with self._driver.session() as session:
            result = session.write_transaction(self._delete_node, node_id)

        return result


    def get_all(self):
        result = None

        with self._driver.session() as session:
            result = session.read_transaction(self._get_all)

        return list(result)

    def set_password(self, password):
        with self._driver.session() as session:
            session.run("CALL dbms.changePassword($password)", password=password)

def cli(user_name=None, password=None):

    parser = argparse.ArgumentParser(description="Neo4j Demo Application.")

    parser.add_argument("--drop", dest="drop", action="store_true")
    parser.add_argument("--init", dest="init", action="store_true")
    parser.add_argument("--all", dest="all", action="store_true")
    parser.add_argument("--password", dest="password", action="store_true")
    args = vars(parser.parse_args())

    app = None

    if args.get("init"):

        print("Init Database")

        try:
            app = App("bolt://localhost:7687", user_name, password)

            app.create_indexes()

            for ix in beer_types:
                app.create_beer_type(ix.get("name"))

            tags = [ix.get("name") for ix in beer_tags]
            app.create_tags(tags)

            for ix in beers:
                app.create_beer(name=ix.get("name"), beer_type=ix.get("type"), tags=ix.get("tags"))

        except ValueError as e:
            print(e)
        except ServiceUnavailable as e:
            print(e)
        except AuthError as e:
            print(e)

    elif args.get("drop"):

        print("Drop Database")

        try:
            app = App("bolt://localhost:7687", user_name, password)
            app.drop()
        except ValueError as e:
            print(e)
        except ServiceUnavailable as e:
            print(e)
        except AuthError as e:
            print(e)

    elif args.get("all"):

        print("Get All Nodes And Relations")

        try:
            app = App("bolt://localhost:7687", user_name, password)
            result = app.get_all()
            print(result)
        except ValueError as e:
            print(e)
        except ServiceUnavailable as e:
            print(e)
        except AuthError as e:
            print(e)

    elif args.get("password"):

        print("setting password")
        app = App("bolt://localhost:7687", user_name, password)
        app.set_password("PASSWORD")
    else:
        print(args)

    if app:
        app.close() # Dont forget to close the driver connection!


def main():

    user_name = "neo4j"
    password = "neo4j"
    #password = "PASSWORD" # first run --password

    cli(user_name, password)


if __name__ == "__main__":

    print("Neo4j: Python Driver Example")

    main()
