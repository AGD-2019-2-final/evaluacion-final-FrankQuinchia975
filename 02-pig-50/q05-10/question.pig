-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

fs -rm -f -r data.tsv;
fs -put data.tsv;

lin = LOAD './data.tsv' USING PigStorage('\t') AS 
(f1:CHARARRAY,
f2:BAG{t:TUPLE(p:CHARARRAY)},
f3:MAP[]);
words = FOREACH lin GENERATE FLATTEN(f2) as word;
grouped = GROUP words BY word;
wordcount = FOREACH grouped GENERATE group, COUNT(words);

STORE wordcount INTO 'output';
fs -copyToLocal output output;