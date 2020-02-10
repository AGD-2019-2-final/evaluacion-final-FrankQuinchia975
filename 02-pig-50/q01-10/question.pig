-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
fs -rm -f -r data.tsv;
fs -put data.tsv;

u = LOAD './data.tsv' USING PigStorage('\t') AS (f1:CHARARRAY, f2:CHARARRAY, f3:INT);
s = GROUP u BY f1;
DUMP s;
r5 = FOREACH s GENERATE group, COUNT(u.f1);


DUMP r5;
STORE r5 INTO 'output';
fs -copyToLocal output output; 