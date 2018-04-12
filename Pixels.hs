-- Proyecto No. 1
-- Laboratorio de Lenguajes de Programacion I
-- Integrantes:
--              Nairelys Hernandez, 12-10199
--              Jawil Ricauter, 13-11199


module Pixels (font,pixelsToString,
        pixelListToPixels,pixelListToString,concatPixels,
        messageToPixels,up,down,left,right,upsideDown,backwards,negative) where

import Data.Char
import Data.List
import Numeric(showHex, showIntAtBase)

fontBitmap =
  [
    [ 0x00, 0x00, 0x00, 0x00, 0x00 ], --  (space)
    [ 0x00, 0x00, 0x5F, 0x00, 0x00 ], --  !
    [ 0x00, 0x07, 0x00, 0x07, 0x00 ], --  "
    [ 0x14, 0x7F, 0x14, 0x7F, 0x14 ], --  #
    [ 0x24, 0x2A, 0x7F, 0x2A, 0x12 ], --  $
    [ 0x23, 0x13, 0x08, 0x64, 0x62 ], --  %
    [ 0x36, 0x49, 0x55, 0x22, 0x50 ], --  &
    [ 0x00, 0x05, 0x03, 0x00, 0x00 ], --  '
    [ 0x00, 0x1C, 0x22, 0x41, 0x00 ], --  (
    [ 0x00, 0x41, 0x22, 0x1C, 0x00 ], --  )
    [ 0x08, 0x2A, 0x1C, 0x2A, 0x08 ], --  *
    [ 0x08, 0x08, 0x3E, 0x08, 0x08 ], --  +
    [ 0x00, 0x50, 0x30, 0x00, 0x00 ], --  ,
    [ 0x08, 0x08, 0x08, 0x08, 0x08 ], --  -
    [ 0x00, 0x60, 0x60, 0x00, 0x00 ], --  .
    [ 0x20, 0x10, 0x08, 0x04, 0x02 ], --  /
    [ 0x3E, 0x51, 0x49, 0x45, 0x3E ], --  0
    [ 0x00, 0x42, 0x7F, 0x40, 0x00 ], --  1
    [ 0x42, 0x61, 0x51, 0x49, 0x46 ], --  2
    [ 0x21, 0x41, 0x45, 0x4B, 0x31 ], --  3
    [ 0x18, 0x14, 0x12, 0x7F, 0x10 ], --  4
    [ 0x27, 0x45, 0x45, 0x45, 0x39 ], --  5
    [ 0x3C, 0x4A, 0x49, 0x49, 0x30 ], --  6
    [ 0x01, 0x71, 0x09, 0x05, 0x03 ], --  7
    [ 0x36, 0x49, 0x49, 0x49, 0x36 ], --  8
    [ 0x06, 0x49, 0x49, 0x29, 0x1E ], --  9
    [ 0x00, 0x36, 0x36, 0x00, 0x00 ], --  :
    [ 0x00, 0x56, 0x36, 0x00, 0x00 ], --  ;
    [ 0x00, 0x08, 0x14, 0x22, 0x41 ], --  <
    [ 0x14, 0x14, 0x14, 0x14, 0x14 ], --  =
    [ 0x41, 0x22, 0x14, 0x08, 0x00 ], --  >
    [ 0x02, 0x01, 0x51, 0x09, 0x06 ], --  ?
    [ 0x32, 0x49, 0x79, 0x41, 0x3E ], --  @
    [ 0x7E, 0x11, 0x11, 0x11, 0x7E ], --  A
    [ 0x7F, 0x49, 0x49, 0x49, 0x36 ], --  B
    [ 0x3E, 0x41, 0x41, 0x41, 0x22 ], --  C
    [ 0x7F, 0x41, 0x41, 0x22, 0x1C ], --  D
    [ 0x7F, 0x49, 0x49, 0x49, 0x41 ], --  E
    [ 0x7F, 0x09, 0x09, 0x01, 0x01 ], --  F
    [ 0x3E, 0x41, 0x41, 0x51, 0x32 ], --  G
    [ 0x7F, 0x08, 0x08, 0x08, 0x7F ], --  H
    [ 0x00, 0x41, 0x7F, 0x41, 0x00 ], --  I
    [ 0x20, 0x40, 0x41, 0x3F, 0x01 ], --  J
    [ 0x7F, 0x08, 0x14, 0x22, 0x41 ], --  K
    [ 0x7F, 0x40, 0x40, 0x40, 0x40 ], --  L
    [ 0x7F, 0x02, 0x04, 0x02, 0x7F ], --  M
    [ 0x7F, 0x04, 0x08, 0x10, 0x7F ], --  N
    [ 0x3E, 0x41, 0x41, 0x41, 0x3E ], --  O
    [ 0x7F, 0x09, 0x09, 0x09, 0x06 ], --  P
    [ 0x3E, 0x41, 0x51, 0x21, 0x5E ], --  Q
    [ 0x7F, 0x09, 0x19, 0x29, 0x46 ], --  R
    [ 0x46, 0x49, 0x49, 0x49, 0x31 ], --  S
    [ 0x01, 0x01, 0x7F, 0x01, 0x01 ], --  T
    [ 0x3F, 0x40, 0x40, 0x40, 0x3F ], --  U
    [ 0x1F, 0x20, 0x40, 0x20, 0x1F ], --  V
    [ 0x7F, 0x20, 0x18, 0x20, 0x7F ], --  W
    [ 0x63, 0x14, 0x08, 0x14, 0x63 ], --  X
    [ 0x03, 0x04, 0x78, 0x04, 0x03 ], --  Y
    [ 0x61, 0x51, 0x49, 0x45, 0x43 ], --  Z
    [ 0x00, 0x00, 0x7F, 0x41, 0x41 ], --  [
    [ 0x02, 0x04, 0x08, 0x10, 0x20 ], --  \
    [ 0x41, 0x41, 0x7F, 0x00, 0x00 ], --  ]
    [ 0x04, 0x02, 0x01, 0x02, 0x04 ], --  ^
    [ 0x40, 0x40, 0x40, 0x40, 0x40 ], --  _
    [ 0x00, 0x01, 0x02, 0x04, 0x00 ], --  `
    [ 0x20, 0x54, 0x54, 0x54, 0x78 ], --  a
    [ 0x7F, 0x48, 0x44, 0x44, 0x38 ], --  b
    [ 0x38, 0x44, 0x44, 0x44, 0x20 ], --  c
    [ 0x38, 0x44, 0x44, 0x48, 0x7F ], --  d
    [ 0x38, 0x54, 0x54, 0x54, 0x18 ], --  e
    [ 0x08, 0x7E, 0x09, 0x01, 0x02 ], --  f
    [ 0x08, 0x14, 0x54, 0x54, 0x3C ], --  g
    [ 0x7F, 0x08, 0x04, 0x04, 0x78 ], --  h
    [ 0x00, 0x44, 0x7D, 0x40, 0x00 ], --  i
    [ 0x20, 0x40, 0x44, 0x3D, 0x00 ], --  j
    [ 0x00, 0x7F, 0x10, 0x28, 0x44 ], --  k
    [ 0x00, 0x41, 0x7F, 0x40, 0x00 ], --  l
    [ 0x7C, 0x04, 0x18, 0x04, 0x78 ], --  m
    [ 0x7C, 0x08, 0x04, 0x04, 0x78 ], --  n
    [ 0x38, 0x44, 0x44, 0x44, 0x38 ], --  o
    [ 0x7C, 0x14, 0x14, 0x14, 0x08 ], --  p
    [ 0x08, 0x14, 0x14, 0x18, 0x7C ], --  q
    [ 0x7C, 0x08, 0x04, 0x04, 0x08 ], --  r
    [ 0x48, 0x54, 0x54, 0x54, 0x20 ], --  s
    [ 0x04, 0x3F, 0x44, 0x40, 0x20 ], --  t
    [ 0x3C, 0x40, 0x40, 0x20, 0x7C ], --  u
    [ 0x1C, 0x20, 0x40, 0x20, 0x1C ], --  v
    [ 0x3C, 0x40, 0x30, 0x40, 0x3C ], --  w
    [ 0x44, 0x28, 0x10, 0x28, 0x44 ], --  x
    [ 0x0C, 0x50, 0x50, 0x50, 0x3C ], --  y
    [ 0x44, 0x64, 0x54, 0x4C, 0x44 ], --  z
    [ 0x00, 0x08, 0x36, 0x41, 0x00 ], --  {
    [ 0x00, 0x00, 0x7F, 0x00, 0x00 ], --  |
    [ 0x00, 0x41, 0x36, 0x08, 0x00 ]  --  }
  ]


------------------------------------------------------

-- Tipo de dato : Pixel
type Pixels =[String]

------------------------------------------------------

                -- Funciones Auxiliares


-- Completa, a cada elemento de la lista, con ceros a la izquierda .

completeBin :: [[Char]] -> [[Char]]
completeBin [] = []
completeBin xs = completeBin1( head xs ): completeBin ( tail xs )


-- Completa los bits con ceros a la izquierda.

completeBin1 :: String -> String
completeBin1 x 
                | ( length x < 7 ) = completeBin1 ( "0" ++ x ) 
                | ( length x < 7 ) = reverse( completeBin1 ( "0" ++ x ) ) 
                | ( length x == 7 ) = x 


-- Pasa de binario a * y " " Ej:  binToString "110110"   >"** ** ".

binToString:: String -> String
binToString [] = ""
binToString xs 
                | ( head xs == '1' ) = "*" ++ binToString ( tail xs ) 
                | ( head xs == '0' ) = " " ++ binToString ( tail xs ) 
                | ( head xs == 'n' ) = "\n" ++ binToString ( tail xs )


--covierte el Pixel a [Char]dibujarListas (font 33) > "****** /n  *   */n  *   */n  *   */n****** /n"

dibujarListas :: (Integral a, Show a) => [a] -> [Char]
dibujarListas [] = []
dibujarListas lista = binToString( completeBin1 ( showIntAtBase 2 intToDigit ( head lista ) "") ) ++ dibujarListas ( tail lista )  


-- Corta el string en grupos de 7, pe. "trololotrololo" -> ["trololo", "trololo"].

cortar :: [t] -> [[t]]
cortar [] = []
cortar lista = primero : cortar sobrante where ( primero, sobrante ) = splitAt 7 lista


-- Traspone una lista (cambia filas por columnas).

traspuesta :: [a] -> [[a]]
traspuesta [] = []
traspuesta lista = transpose $ cortar lista


-- Se hace reverse a la lista.

vuelta :: [a] -> [[a]]
vuelta lista = reverse ( traspuesta lista )


-- Metodo para imprimir pixeles.

imprimir :: Pixels -> IO()
imprimir lista = mapM_ print lista


-- Funcion que concatena strings.

concatenar :: Pixels -> [Char]
concatenar [] = ""
concatenar lista_char = head lista_char ++ concatenar ( tail lista_char )


-- Metodo font que devuelve el grafico del caracter.

font :: Char -> Pixels
font a =  vuelta ( dibujarListas ( fontBitmap!!( ( ord a ) -32 ) ) )


-- Concatena la forma grafica de un pixel sin espacio en medio.

concatAlLado :: [[t]] -> [t]
concatAlLado [] = []
concatAlLado lista_pixels = ( head lista_pixels ) ++ concatAlLado ( tail lista_pixels )


-- Concatena dos pixeles horizontalmente con un espacio en medio.

concatHorizontalConEspacio :: [Char] -> [Char]
concatHorizontalConEspacio [] = []
concatHorizontalConEspacio lista = dibujarListas ( ( fontBitmap!!( ord(head lista) -32) ) ) ++ "       " ++ concatHorizontalConEspacio (tail lista) 


-- Funcion que remplaza los bits encendidos por los apagados y viceversa.

astToSpace :: [Char] -> [Char]
astToSpace [] = ""
astToSpace xs 
                | ( head xs == '*' ) = " " ++ astToSpace ( tail xs ) 
                | ( head xs == ' ' ) = "*" ++ astToSpace ( tail xs )

up_aux :: String -> String
up_aux pixel = reverse ( take ( ( length pixel ) - 1 ) ( reverse pixel ) ) ++ [head pixel] 

down_aux :: String -> String
down_aux pixel = last pixel : take ( ( length pixel ) - 1 ) pixel
------------------------------------------------------


-- PixelToString convierte un valor del tipo pixel, en un string, incluyendo los saltos.

pixelsToString :: Pixels -> String
pixelsToString fuente = concatenar ( fuente )


------------------------------------------------------


-- pixelListToPixels convierte una lista de Pixeles en un unico valor Pixels que lo represente.

pixelListToPixels :: [Pixels] -> Pixels
pixelListToPixels [] = []
pixelListToPixels lista_pixels = ( head lista_pixels ) ++ ["     "] ++ pixelListToPixels ( tail lista_pixels )


------------------------------------------------------


-- Procesa lista de pixels, convirtiendo cada elemento a string
-- y luego mezcla todos los resultados incluyendo saltos de linea.

pixelListToString :: [Pixels] -> [String]
pixelListToString lista_pixels = pixelListToPixels ( lista_pixels )


------------------------------------------------------


-- Recibe una llista de pixeles y produce un nuevo valor
-- que lo representa, pero realiza la concatenacion horizontal.

concatPixels ::[Pixels] -> Pixels

concatPixels lista_pixels = foldr1 (zipWith(++)) lista_pixels


------------------------------------------------------


-- Funcion que convierte una cadena de caracteres en un valor
-- Pixels, agregando un espacio blanco entre caracteres.

messageToPixels :: [Char] -> Pixels
messageToPixels lista = vuelta ( concatHorizontalConEspacio lista )


------------------------------------------------------

           
                -- Efectos Especiales


-- Desplaza una hilera hacia arriba.

up :: Pixels -> Pixels
up pixel = reverse ( take ( ( length pixel ) - 1 ) ( reverse pixel ) ) ++ [head pixel] 

-- Desplaza una hilera hacia abajo.

down :: Pixels -> Pixels
down pixel = last pixel : take ( ( length pixel ) - 1 ) pixel

-- Desplaza la primera columna hacia la derecha.

left :: Pixels -> Pixels
left [] = []
left pixel = up_aux ( head pixel ) : left ( tail pixel ) 

-- Desplaza la primera columna hacia la izquierda.

right :: Pixels -> Pixels
right [] = []
right pixel = down_aux  (head pixel ) : right ( tail pixel )

-- Invierte el orden de las filas.

upsideDown :: Pixels -> Pixels
upsideDown pixel = reverse pixel

-- Invierte el orden de las columnas.

backwards :: Pixels-> Pixels
backwards [] = []
backwards pixel = reverse ( head pixel ) : backwards ( tail pixel )

-- Intercambia blanco por asteriscos y viceversa.

negative :: Pixels -> Pixels 
negative [] = []
negative pixel = astToSpace ( head pixel ) : negative ( tail pixel ) 
