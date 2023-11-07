import random
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
        specification = int(input('Please specify which agent by typing the agent number: '))
        for agent in database_connect.agents_outcome:
            if specification == agent[0]:
                wanted_info = int(input('Select one of the option by typing the corrisponding number:\n 1. Role Description\n 2. Agent Abilities\n'))
                if wanted_info == 1:
                    database_connect.get_role_details(agent[2], agent[0])
                else:
                    database_connect.get_ability_details(agent[0], agent[2])
                    
    else:
        database_connect.agents_outcome.clear()
        print('Thank you for using this program!')

def user_input():
    num = input('How many agents do you need? ')
    agent_number = int(num)
    if agent_number > 5:
        input('Numbers of agents cannot be more than 5, please try again ')
        return user_input()
    else:
        database_connect.database_connection(agent_number)
        print('Angent n° | Name | Role')
        for agent in database_connect.agents_outcome:
            
            print('-' + ' ' + str(agent[0]) + ' | ' + agent[1] + ' | ' + agent[2])
        get_agents_info()




user_input()
