defmodule Secuencial do
  def format(tokens) do
    {_, list, _} = tokens
    Enum.map(list, fn {token, _num, tchars} ->
      case token do
        :tab -> "<p style=\"display: inline\">&nbsp;&nbsp;&nbsp;&nbsp;</p>"
        :tabtab -> "<p style=\"display: inline\">&nbsp;&nbsp;&nbsp;&nbsp;</p>"
        :space -> "<span> </span>"
        :return -> "<br>"
        token -> "<span class=\"#{token}\">#{tchars}</span>"
      end
    end)
  end

  def read(directory) do
    files = Path.wildcard(directory <> "/**/*.js")

    for file <- files do
      name = file
        |> to_charlist()
        |> Enum.reverse()
        |> Enum.take_while(fn x -> x != ?/ end)
        |> Enum.reverse()
        |> to_string()

      File.read!(file)
        |>  to_charlist()
        |> :lexer.string
        |> format()
        |> Enum.join()
        |> write(name)
    end
  end

  def write(data, name) do
    html = "<!DOCTYPE html>
    <html lang=\"en\">
    <head>
        <meta charset=\"UTF-8\">
        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">
        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
        <link rel=\"stylesheet\" href=\"../style.css\">
        <title>LEEX</title>
    </head>
    <body>
    <div class=\"header\">
      <div class=\"header-titles\">
        <h1>Lexer Syntax <span style=\"color: yellow; font-family: sans-serif;\">Highlighter</span></h1>
        <h2>Oscar Emiliano Ramírez Díaz A01660338</h2>
        <h2>Maria Fernanda Ramírez Romero A01735334</h2>
      </div>
      <div>
        <img src=\"../elixir-icon.png\" style=\"width: 40px; margin-right: 10px;\">
        <img src=\"../js-logo.png\" style=\"width: 40px; margin-right: 30px;\">
      </div>
    </div>
    <section>
      #{data}
    </section>
    </body>
    </html>"
    File.write!("output/" <> name <> ".html", html)
  end
end
