module Pages
  def info_api
    @info_api ||= InfoAPI.new
  end
end

World(Pages)
