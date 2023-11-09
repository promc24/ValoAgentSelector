import database_connect

#def choose_agent(agent_num):
    #list_of_agents = set(['Brimstone', 'Viper', 'Omen', 'Killjoy', 'Cypher', 'Sova', 'Sage', 'Phoenix',
                      #'Jett', 'Reyna', 'Raze', 'Breach', 'Skye', 'Yoru', 'Astra', 'KAY/O', 'Chamber',
                      #'Neon', 'Fade', 'Harbor', 'Gekko', 'Deadlock'])
    

    
    #return print(random.choices(list(list_of_agents), k=agent_num))


#Get further information of agents dependin gon user's needs
def get_agents_info():
    info = input('Would you like some info of the agents?').upper()
    #Check if user requires more info
    if info == 'Y' or info == 'YES':
        #Boolean used to break the nested while loops
        w_loop = True
        w_loop2 = True
        #Start of first while loop
        while w_loop == True:
            specification = int(input('Please specify which agent by typing the agent number: '))
            #For loop to check if the selected agent is in the given list
            for i,agent in enumerate(database_connect.agents_outcome):
                #If number present in the least start second while loop
                if specification == agent[0]:
                    while w_loop2 == True:
                        wanted_info = int(input('Select one of the option by typing the corrisponding number:\n 1. Role Description\n 2. Agent Abilities\n'))
                        #fetch role details data from database_connect.py
                        if wanted_info == 1:
                            database_connect.get_role_details(agent[2], agent[0])
                            #Set boolean to false to break the loops
                            w_loop = False
                            w_loop2 = False
                        #fetch abilities details data from database_connect.py
                        elif wanted_info == 2:
                            database_connect.get_ability_details(agent[0], agent[2])
                            #Set boolean to false to break the loops
                            w_loop = False
                            w_loop2 = False
                        else:
                            #Warn user and restart loop
                            print("Please try again and make sure it's the corrisponding info number!")

                else:
                    #Restart loop if inserted number is not in the given list
                    if i == len(database_connect.agents_outcome) - 1:
                        print("Please try again and make sure it's the correct agent number!")
                    
                    
                    
    else:
        #Empty list and end program
        database_connect.agents_outcome.clear()
        print(database_connect.end_program_msg)

#Main function
def user_input():
    #Initial message
    print('Welcome to Agent Selector!\n')
    #Start of while loop
    while True:
        num = input('How many agents do you need? ')
        agent_number = int(num)
        #Check if the inputted number is greater than 5
        if agent_number > 5:
            #If greater restarts loop
            print('Numbers of agents cannot be more than 5, please try again!')
            continue
        else:
            #Fetch the needed data from database_connect.py
            database_connect.database_connection(agent_number)
            print('Angent n° | Name | Role')
            #for loop to print the number of agents
            for agent in database_connect.agents_outcome:
                print('-' + ' ' + str(agent[0]) + ' | ' + agent[1] + ' | ' + agent[2])
            #call the function that gives information of each agent
            get_agents_info()
            #break loop when done
            break

user_input()
