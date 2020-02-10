import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":

    ##
    ## itera sobre cada linea de codigo recibida
    ## a traves del flujo de entrada
    ##
    
    for line in sys.stdin:
        ##line = line.strip()
        splits = line.split(",")
        ##print(line)
        ##print(splits[2])
        
        ##
        ## genera las tuplas palabra \tabulador 1
        ## ya que es un conteo de palabras
        ##
        sys.stdout.write("{}\t1\n".format(splits[2]))
