import sqlite3
import os

#global variables
db_path = 'database/valorant_agents.db'
agents_outcome = []
end_program_msg = 'Thank you for using this program!'


def database_connection(agent_number):
    #excutes sql and fetches the needed data
    def access_db():
            
            try:
                #Connect to DB and creates a cursor
                sqliteConnection = sqlite3.connect(db_path)
                cursor = sqliteConnection.cursor()
                #Fetch the random agents numbers
                cursor.execute("SELECT * FROM agents_details ORDER BY RANDOM() LIMIT " + str(agent_number) +";")
                #Fetch and outputs results
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
            #print('connection SQLIte established')
            #executes the database script and creates the DB
            cursor.executescript(query)
            #Closes DB connection and runs the data fetching function
            sqliteConnection.close()
            access_db()
        
        # Handle errors
        except sqlite3.Error as error:
            print('Error occurred - ', error)

#Function to fetch agent role details   
def get_role_details(role, agent_num):

    try:
        #Connects to DB and creates a cursor
        sqliteConnection = sqlite3.connect(db_path)
        cursor = sqliteConnection.cursor()
        #fetch role details thorugh the role name
        cursor.execute("SELECT role_details FROM agents_role WHERE a_role = '" + role + "'")
        #Fetch and outputs results
        result = cursor.fetchall()
        print(role + '\n\n' + result[0][0])
        #Closes DB connecton
        sqliteConnection.close()

        #Directs user to role and ability info menu if yes
        ability_info = input("Would you like to learn about the Agent's abilities? ").upper()
        if ability_info == 'Y' or ability_info == 'YES':
            get_ability_details(agent_num, role)
        else:
            #Empty list and end program
            agents_outcome.clear()
            print(end_program_msg)

    #Handle errors
    except sqlite3.Error as error:
        print('Error occurred - ', error)

#Function to fetch Ability informations
def get_ability_details(agent_num, role):

    try:
        #Connects to DB and creates a cursor
        sqliteConnection = sqlite3.connect(db_path)
        cursor = sqliteConnection.cursor()
        #Fetch anilities names thought agent number
        cursor.execute("SELECT ability_name FROM agents_abilities WHERE a_num = '" + str(agent_num) + "'")
        #Fetchs and outputs results
        result = cursor.fetchall()
        #print(role + '\n\n')
        print('Special Abilities names:\nQ. ' + result[0][0] + '\nE. ' + result[1][0] + '\nC. ' + result[2][0] + '\nX. ' + result[3][0])
        #starts while loop
        while True:
            ability_detail = input('Type the ability letter to see its details or 1 to see all the details together: ').upper()
            #depending on user answer fetches corrisponding info
            if ability_detail == 'Q':
                cursor.execute("SELECT ability_details FROM agents_abilities WHERE ability_name = '" + result[0][0] + "'")
                outcome = cursor.fetchall()
                print(result[0][0] + '\n\n' + outcome[0][0])
                check_rest = input('Would you like to check the other abilities? ').upper()
                #breaks or continues the loop depensing if user wants more info 
                if check_rest == 'Y' or check_rest == 'YES':
                    continue
                else:
                    break
            elif ability_detail == 'E':
                cursor.execute("SELECT ability_details FROM agents_abilities WHERE ability_name = '" + result[1][0] + "'")
                outcome = cursor.fetchall()
                print(result[1][0] + '\n\n' + outcome[0][0])
                check_rest = input('Would you like to check the other abilities? ').upper()
                #breaks or continues the loop depensing if user wants more info 
                if check_rest == 'Y' or check_rest == 'YES':
                    continue
                else:
                    break
            elif ability_detail == 'C':
                cursor.execute("SELECT ability_details FROM agents_abilities WHERE ability_name = '" + result[2][0] + "'")
                outcome = cursor.fetchall()
                print(result[2][0] + '\n\n' + outcome[0][0])
                check_rest = input('Would you like to check the other abilities? ').upper()
                #breaks or continues the loop depensing if user wants more info 
                if check_rest == 'Y' or check_rest == 'YES':
                    continue
                else:
                    break
            elif ability_detail == 'X':
                cursor.execute("SELECT ability_details FROM agents_abilities WHERE ability_name = '" + result[3][0] + "'")
                outcome = cursor.fetchall()
                print(result[3][0] + '\n\n' + outcome[0][0])
                check_rest = input('Would you like to check the other abilities? ').upper()
                #breaks or continues the loop depensing if user wants more info 
                if check_rest == 'Y' or check_rest == 'YES':
                    continue
                else:
                    break
            elif ability_detail == '1':
                #fetched all ability names and details and breaks the loop
                cursor.execute("SELECT ability_name, ability_details FROM agents_abilities WHERE a_num = '" + str(agent_num) + "'")
                outcome = cursor.fetchall()
                print('- ' + outcome[0][0] + '\n\n' + outcome[0][1] + '\n\n')
                print('- ' + outcome[1][0] + '\n\n' + outcome[1][1] + '\n\n')
                print('- ' + outcome[2][0] + '\n\n' + outcome[2][1] + '\n\n')
                print('- ' + outcome[3][0] + '\n\n' + outcome[3][1] + '\n\n')
                break
            else:
                #Warn message and restarts loop
                print('Please make sure you typed the right letter!')
        
        #Close DB connection
        sqliteConnection.close()
        #Directs user to role and abilities menu if wanted
        ability_info = input("Would you like to learn about the Agent's role? ").upper()
        if ability_info == 'Y' or ability_info == 'YES':
            get_role_details(role, agent_num)
        else:
            ##Empty list and end program
            agents_outcome.clear()
            print(end_program_msg)
    #Handle errors
    except sqlite3.Error as error:
        print('Error occurred - ', error)