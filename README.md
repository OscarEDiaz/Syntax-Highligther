# Syntax-Highligther
Syntax highlighther made with Elixir (functional programming) and Erlang (regular expressions).

## How to use it
First of all run ```mix deps.get``` to get all the dependencies.

The program reads data from **.js** files located in the *output* folder. This file are generated with random blocks of predefined code by the function generate() which receives a number that indicates the quantity of files. The algorithm can also read .js files from nested folders.

To generate files use the following code:
````
Generator.generate(quantity)
````
This function also removes all the previous files and adds new ones.

To run the main program use the function ```Concurrente.read``` to execute de concurrent version, use  ```Secuencial.read``` for the sequential one. The function has only one parameter and it's the **folder name** in quoting marks. The final outputs are created inside the output folder and they are HTML files that can be viewed in the browser to see the final highlighted code.