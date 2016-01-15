defmodule KV.Bucket do
  @doc """
    Starts a new bucket
  """
  def start_link do 
    Agent.start_link(fn -> %{} end)
  end

  @doc """
    Gets a value by key
  """
  def get(bucket, key) do 
    Agent.get(bucket, &Map.get(&1, key))
  end

  @doc """
    puts a value by a key
  """
  def put(bucket, key, value) do
    Agent.update(bucket, &Map.put(&1, key, value))
  end

  @doc """
    deletes a key from the bucket
  """
  def delete(bucket, key) do
    # puts the client to sleep
    :timer.sleep(1000)
    Agent.get_and_update(bucket, fn dict ->
      # puts the server to sleep
      :timer.sleep(1000)
      Map.pop(dict, key)
    end)
  end

end
