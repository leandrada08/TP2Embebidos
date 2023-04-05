# Declaro y defino las variables que usare

SRC_DIR = ./src #Direccion de los codigos fuente
OUT_DIR = ./build #Direccion de la carpeta de salida
OBJ_DIR = $(OUT_DIR)/obj #Direccion del codigo objeto
BIN_DIR = $(OUT_DIR)/din #Direccion del codigo ejecutable
SRC_FILES = $(wildcard $(SRC_DIR)/*.c) #Lista de archivos que hay que compilar
OBJ_FILES = $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRC_FILES)) #Lista de archivos .o que necesito generar. El % es lo que no cambiara

# Defino las reglas
# Defino regla para ejecutar por defecto
.DEFAULT_GOAL:= all

# Creo la carpeta /build
$(OUT_DIR):
	mkdir $(OUT_DIR)
# Creo la carpeta /build/obj
$(OBJ_DIR): $(OUT_DIR)
	mkdir $(OUT_DIR)

# Regla para generar los codigos objeto a partir de los codigos fuente 
$(OBJ_DIR)/%.o: $(OBJ_DIR) $(SRC_DIR)/%.c
	gcc -c $(SRC_DIR)/%.c -o $@



all: $(OBJ_FILES) #Pongo que necesito OBJ_FILES, para que cuando busque conseguir esto, consiga todo lo otro
	echo $(SRC_FILES)
	echo $(OBJ_FILES)

clean: $(OUT_DIR)
	rm -r $(OUT_DIR)
