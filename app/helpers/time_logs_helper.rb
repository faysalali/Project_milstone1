module TimeLogsHelper
  def render_action(time_log, project)
    time_log.persisted? ? time_log : [project, time_log]
  end
end
