defmodule Mix.Tasks.LogReports do
  use Mix.Task
  alias Swoosh.Mailer
  alias Swoosh.Email
  alias Twitter.Mailer

  def run(date) do
    IO.puts("Reading Log...")
    logs = File.read!("log/development.log")

    error_count = Enum.count(String.split(logs, "ERROR"))
    IO.puts("Total Error Count: #{error_count}")

    email = Email.new()
      |> Email.from("noreply@example.com")
      |> Email.to("admin@example.com")
      |> Email.subject("[Twitter] Log report #{date}")
      |> Email.text_body("Total Error Count: #{error_count}")

    case Mailer.deliver(Twitter.Mailer, email) do
      :ok ->
        IO.puts("Log report email sent successfully.")
      {:error, reason} ->
        IO.puts("Failed to send email: #{reason}")
    end
  end
end
