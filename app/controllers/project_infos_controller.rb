# encoding: utf-8
class ProjectInfosController < ApplicationController
  # GET /project_infos/new
  # GET /project_infos/new.json
  def new
    @project_infos = ProjectInfo.order("created_at DESC")
    @project_infos_grouped = ProjectInfo.grouped_by_project
  end

  # POST /project_infos
  # POST /project_infos.json
  def create
    project_info = ProjectInfo.create_me(params[:combi])
    project_info.save
    if ProjectInfo.find_by_name(project_info.name)
      is_neu = ""
    else
      is_neu = "neues "
    end

    flash[:notice] = "eintrag für #{is_neu}projekt #{project_info.name} angelegt"
    redirect_to root_path
  end

  # DELETE /project_infos/1
  # DELETE /project_infos/1.json
  def destroy
    @project_info = ProjectInfo.find(params[:id])
    @project_info.destroy

    respond_to do |format|
      format.html { redirect_to project_infos_url }
      format.json { head :no_content }
    end
  end
end
