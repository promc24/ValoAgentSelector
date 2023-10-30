import random
import database_connect
#def choose_agent(agent_num):
    #list_of_agents = set(['Brimstone', 'Viper', 'Omen', 'Killjoy', 'Cypher', 'Sova', 'Sage', 'Phoenix',
                      #'Jett', 'Reyna', 'Raze', 'Breach', 'Skye', 'Yoru', 'Astra', 'KAY/O', 'Chamber',
                      #'Neon', 'Fade', 'Harbor', 'Gekko', 'Deadlock'])
    

    
    #return print(random.choices(list(list_of_agents), k=agent_num))

def user_input():
    num = input('How many agents do you need? ')
    agent_number = int(num)
    if agent_number > 5:
        input('Numbers of agents cannot be more than 5, please try again ')
        return user_input()
    else:
        database_connect.access_db(agent_number)

user_input()
