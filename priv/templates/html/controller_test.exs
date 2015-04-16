defmodule <%= module %>ControllerTest do
  use <%= base %>.ConnCase

  alias <%= module %>

  @valid_params <%= singular %>: <%= inspect params %>
  @invalid_params <%= singular %>: %{}

  test "GET /<%= plural %>" do
    conn = get conn(), <%= singular %>_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing <%= plural %>"
  end

  test "GET /<%= plural %>/new" do
    conn = get conn(), <%= singular %>_path(conn, :new)
    assert html_response(conn, 200) =~ "New <%= singular %>"
  end

  test "POST /<%= plural %>" do
    conn = post conn(), <%= singular %>_path(conn, :create), @valid_params
    assert redirected_to(conn) == <%= singular %>_path(conn, :index)
  end

  test "POST /<%= plural %> failure returns to the New page" do
    conn = post conn(), <%= singular %>_path(conn, :create), @invalid_params
    assert html_response(conn, 200) =~ "New <%= singular %>"
  end

  test "GET /<%= plural %>/:id" do
    <%= singular %> = Repo.insert %<%= alias %>{}
    conn = get conn(), <%= singular %>_path(conn, :show, <%= singular %>.id)
    assert html_response(conn, 200) =~ "Show <%= singular %>"
  end

  test "GET /<%= plural %>/:id/edit" do
    <%= singular %> = Repo.insert %<%= alias %>{}
    conn = get conn(), <%= singular %>_path(conn, :edit, <%= singular %>.id)
    assert html_response(conn, 200) =~ "Edit <%= singular %>"
  end

  test "PUT /<%= plural %>/:id failure returns to the Edit page" do
    <%= singular %> = Repo.insert %<%= alias %>{}
    conn = put conn(), <%= singular %>_path(conn, :update, <%= singular %>.id), @invalid_params
    assert html_response(conn, 200) =~ "Edit <%= singular %>"
  end

  test "PUT /<%= plural %>/:id" do
    <%= singular %> = Repo.insert %<%= alias %>{}
    conn = put conn(), <%= singular %>_path(conn, :update, <%= singular %>.id), @valid_params
    assert redirected_to(conn) == <%= singular %>_path(conn, :index)
  end

  test "DELETE /<%= plural %>/:id" do
    <%= singular %> = Repo.insert %<%= alias %>{}
    conn = delete conn(), <%= singular %>_path(conn, :delete, <%= singular %>.id)
    assert redirected_to(conn) == <%= singular %>_path(conn, :index)
  end
end
