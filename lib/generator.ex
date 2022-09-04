defmodule Generator do

  def genData() do
    part1 = "const d = {
      _a_: 123,
      _b: 1234
    }

    let y = 123421.213;

    let t = true;
    let f = false;
    let b = 0b10101010;
    let o = 0o13413;
    let h = 0xAF12021

    if (x != 10) {
      y = 20;
    }

    let templatestring = `hola`;

      var arreglo = [123, \"hola\", variable, 123.1233]
      "
    part2 = "class Rectangulo {
        constructor(alto, ancho) {
            this.alto = alto;
            this.ancho = ancho;
        }
        // Getter
        get area_test() {
            return this.calcArea();
        }
        // Método
        calc_Area() {
            return this.alto * this.ancho;
        }
      }
      "
    part3 = "while (y < 5) {
          y++;
        }

        switch (y) {
          case value:
              x = 3;
              break;

          default:
              break;
        }
        function hola() {
          console.log(\"test\");
      }

      var File = function(url, object){
        File.list = Array.isArray(File.list)? File.list : [];
        File.progress = File.progress || 0;
        this.progress = 0;
        this.object = object;
        this.url = url;
      };

      File.indexOf = function(term){
        for(var index in File.list){
          var file = File.list[index];
          if (file.equals(term) || file.url === term || file.object === term) {
            return index;
          }
        }
        return -1;
      };
      "
    part4 = "File.find = function(term){
        var index = File.indexOf(term);
        return ~index && File.list[index];
      };

      File.prototype.equals = function(file){
        var isFileType = file instanceof File;
        return isFileType && this.url === file.url && this.object === file.object;
      };

      File.prototype.save = function(update){
        update = typeof update === 'undefined'? true : update;
        if(Array.isArray(File.list)){
          var index = File.indexOf(this);
          if(~index && update) {
            File.list[index] = this;
            console.warn('File `%s` has been loaded before and updated now for: %O.', this.url, this);
          }else File.list.push(this);
          console.log(File.list)
        }else{
          File.list = [this];
        }
        return this;
      };
      "
    [part1, part2, part3, part4]
      |> List.duplicate(Enum.random(1..10))
      |> List.flatten()
      |> Enum.shuffle()
      |> Enum.join()
  end

  def generate(quantity) do
    File.rm_rf("files")
    File.mkdir_p("files")
    File.mkdir_p("files/nested files")
    File.mkdir_p("files/nested files/nested nested files")
    File.write!("files/nested files/test_nested.js", genData())
    File.write!("files/nested files/nested nested files/test_nested_nested.js", genData())

    for x <- 1..quantity do
      File.write!("files/index#{x}.js", genData())
    end

    File.rm_rf("output")
    File.mkdir_p("output")
  end
end
