import sqlite3
import os

db_path = 'database/valorant_agents.db'
agents_outcome = []

def database_connection(agent_number):

    #excutes sql and fetches the needed data
    def access_db():
            
            try:
                #Connects to DB and creates a cursor
                sqliteConnection = sqlite3.connect(db_path)
                cursor = sqliteConnection.cursor()
                # Query eecuted with cursor
                cursor.execute("SELECT * FROM agents_details ORDER BY RANDOM() LIMIT " + str(agent_number) +";")
                #Fetchs and outputs results
                result = cursor.fetchall()
                for row in result:
                    agents_outcome.append(row)
                #Closes DB connecton
                sqliteConnection.close()
            #Handle errors
            except sqlite3.Error as error:
                print('Error occurred - ', error)
                 
    

    #Checks if the database exists
    if os.path.exists(db_path):
        access_db()

    else:
        sqliteConnection = None
            
        try:
        
            #Connects to DB and creates a cursor
            sqliteConnection = sqlite3.connect(db_path)       
            #Writes a query and executes it with cursor
            sql_file = open('database/valorant_agents.sql', 'r')
            query = sql_file.read()

            cursor = sqliteConnection.cursor()
            print('connection SQLIte established')
            cursor.executescript(query)
            #Closes DB connection and runs the data fetching function
            sqliteConnection.close()
            access_db()
        
        # Handle errors
        except sqlite3.Error as error:
            print('Error occurred - ', error)
        
def get_role_details(role, agent_num):

    try:
        #Connects to DB and creates a cursor
        sqliteConnection = sqlite3.connect(db_path)
        cursor = sqliteConnection.cursor()
        # Query eecuted with cursor
        cursor.execute("SELECT role_details FROM agents_role WHERE a_role = '" + role + "'")
        #Fetchs and outputs results
        result = cursor.fetchall()
        print(role + '\n\n' + result[0][0])
        #Closes DB connecton
        sqliteConnection.close()

        ability_info = input("Would you like to learn about the Agent's abilities? ").upper()
        if ability_info == 'Y' or ability_info == 'YES':
            get_ability_details(agent_num)
        else:
            agents_outcome.clear()
            print('Thank you for using this program!')

    #Handle errors
    except sqlite3.Error as error:
        print('Error occurred - ', error)

def get_ability_details(agent_num, role):

    try:
        #Connects to DB and creates a cursor
        sqliteConnection = sqlite3.connect(db_path)
        cursor = sqliteConnection.cursor()
        # Query eecuted with cursor
        cursor.execute("SELECT ability_name FROM agents_abilities WHERE a_num = '" + str(agent_num) + "'")
        #Fetchs and outputs results
        result = cursor.fetchall()
        #print(role + '\n\n')
        print('Special Abilities names:\nQ. ' + result[0][0] + '\nE. ' + result[1][0] + '\nC. ' + result[2][0] + '\nX. ' + result[3][0])
        #Closes DB connecton
        
        ability_detail = input('Type the ability letter to see its details or 1 to see all the details together: ').upper()
        if ability_detail == 'Q':
            cursor.execute("SELECT ability_details FROM agents_abilities WHERE ability_name = '" + result[0][0] + "'")
            outcome = cursor.fetchall()
            print(result[0][0] + '\n\n' + outcome[0][0] )
        elif ability_detail == 'E':
            cursor.execute("SELECT ability_details FROM agents_abilities WHERE ability_name = '" + result[1][0] + "'")
            outcome = cursor.fetchall()
            print(result[1][0] + '\n\n' + outcome[0][0] )
        elif ability_detail == 'C':
            cursor.execute("SELECT ability_details FROM agents_abilities WHERE ability_name = '" + result[2][0] + "'")
            outcome = cursor.fetchall()
            print(result[2][0] + '\n\n' + outcome[0][0] )
        elif ability_detail == 'X':
            cursor.execute("SELECT ability_details FROM agents_abilities WHERE ability_name = '" + result[3][0] + "'")
            outcome = cursor.fetchall()
            print(result[3][0] + '\n\n' + outcome[0][0] )
        
        
        sqliteConnection.close()
        ability_info = input("Would you like to learn about the Agent's role? ").upper()
        if ability_info == 'Y' or ability_info == 'YES':
            get_role_details(role, agent_num)
        else:
            agents_outcome.clear()
            print('Thank you for using this program!')
    #Handle errors
    except sqlite3.Error as error:
        print('Error occurred - ', error)