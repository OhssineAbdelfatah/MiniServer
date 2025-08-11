CC = c++
CPPFLAGS = -Werror -Wextra -Werror -std=c++98

SRCERV = server.cpp 
SERVER_OBJ = $(SRCERV:.cpp=.o)

SRCCLIN = client.cpp 
CLIENT_OBJ = $(SRCCLIN:.cpp=.o)

SERVER = webserv
CLIENT = client

all : $(SERVER) $(CLIENT)

$(SERVER) : $(SERVER_OBJ) 
	$(CC) $(CPPFLAGS) -o $@ $^

$(CLIENT) : $(CLIENT_OBJ)
	$(CC) $(CPPFLAGS) -o $@ $^

%.o: %.cpp
	$(CC) $(CPPFLAGS) -c $< -o $@

clean:
	rm -f $(SERVER_OBJ) $(CLIENT_OBJ) $(COMMON_OBJ)

fclean: clean
	rm -f $(SERVER) $(CLIENT)

re: fclean all

.PHONY: all clean fclean re