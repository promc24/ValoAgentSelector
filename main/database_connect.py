import sqlite3
import os

db_path = 'database/agents_details.db'

def database_connection(agent_number):

    def access_db():

            sqliteConnection = sqlite3.connect(db_path)
            cursor = sqliteConnection.cursor()

            cursor.execute("SELECT * FROM agents_details ORDER BY RANDOM() LIMIT " + str(agent_number) +";")
            # Fetch and output result
            result = cursor.fetchall()
            for row in result:
                print(row)

            sqliteConnection.close()

    if os.path.exists(db_path):
        access_db()

    else:



        sqliteConnection = None
            
        try:
        
            # Connect to DB and create a cursor
            sqliteConnection = sqlite3.connect(db_path)
            
            #print('DB created')
        
            # Write a query and execute it with cursor
            sql_file = open('database/agents_details.sql', 'r')
            query = sql_file.read()

            cursor = sqliteConnection.cursor()
            print('connection SQLIte established')
            cursor.executescript(query)
            #sqliteConnection.commit()
            #print(query)
        
            # Fetch and output result
            #result = cursor.fetchall()
            #print(result)
            
        
            # Close the cursor
            sqliteConnection.close()
            access_db()
        
        # Handle errors
        except sqlite3.Error as error:
            print('Error occurred - ', error)
        
        # Close DB Connection irrespective of success
        # or failure
        #finally:
        
            #if sqliteConnection:
                #sqliteConnection.close()
                #print('SQLite Connection closed')