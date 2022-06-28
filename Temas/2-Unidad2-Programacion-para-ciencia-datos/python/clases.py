
class Usuario:
    # Atributos de clase
    username = 'Jim'
    email = '@'

    def __init__(self, username):
        self.username = username


user1 = Usuario('Pedro')
# __dict__  (diccionario de datos de nuestro objeto)
# Python puede crear atributos en tiempo de ejecución
# 1.- Verifica si el attr existe dentro del objeto
# 2.- Verifica si el attr existe dentro de la clase
# 3.- Lanza un error 
print(Usuario.username)
print(user1.username)



