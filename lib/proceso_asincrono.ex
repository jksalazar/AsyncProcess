defmodule ProcesoAsincrono do

  # Función para iniciar el proceso
  def start_process do
    spawn(fn -> process_loop() end)  # Crea un proceso independiente
  end

  # Bucle que maneja la recepción y procesamiento de mensajes
  defp process_loop do
    receive do
      {:message, msg} ->
        IO.puts("Mensaje recibido: #{msg}")
        process_message(msg)
        process_loop()  # Llama de nuevo a process_loop para seguir escuchando
      {:stop, reason} ->
        IO.puts("Proceso detenido: #{reason}")
        :ok  # El proceso se detiene aquí y no llama más a process_loop
      after 5000 ->  # Espera 5 segundos para recibir un mensaje
        IO.puts("No se recibió ningún mensaje en 5 segundos. Continuando...")
        process_loop()  # Mantiene el proceso en ejecución para recibir más mensajes
    end
  end

  # Función para procesar el mensaje recibido
  defp process_message(msg) do
    # Aquí va la lógica que procesa el mensaje
    IO.puts("Procesando mensaje: #{msg}")
  end
end
