defmodule DermWeb.ViewComponents do
  use Phoenix.Component
  import Phoenix.HTML.Form
  import Phoenix.HTML.Link

  def input(%{type: "email"} = assigns) do
    ~H"""
    <%= label(@f, @field, class: "block font-bold") %>
    <%= email_input(@f, @field,
      required: Map.get(assigns, :required, false),
      autofocus: Map.get(assigns, :autofocus, false),
      placeholder: Map.get(assigns, :placeholder, "alias@example.com"),
      class:
        "w-full appearance-none rounded border py-2 px-3 leading-tight text-gray-700 shadow focus:outline-none focus:ring-2"
    ) %>
    """
  end

  def input(%{type: "password"} = assigns) do
    ~H"""
    <%= label(@f, @field, class: "block font-bold") %>
    <%= password_input(@f, @field,
      required: Map.get(assigns, :required, false),
      placeholder: Map.get(assigns, :placeholder, "Y0urSecurePa33w0rd"),
      class:
        "w-full appearance-none rounded border py-2 px-3 leading-tight text-gray-700 shadow focus:outline-none focus:ring-2"
    ) %>
    """
  end

  def input(%{type: "checkbox"} = assigns) do
    ~H"""
    <%= label do %>
      <%= checkbox(@f, @field) %>
      <%= @label %>
    <% end %>
    """
  end

  def submit_button(%{} = assigns) do
    ~H"""
    <%= submit(@label, class: "w-full rounded-md bg-gray-500 px-4 py-2 text-gray-100 shadow-md") %>
    """
  end

  def anchor(%{} = assigns) do
    ~H"""
    <%= link(@label, to: @to, class: "underline") %>
    """
  end
end
