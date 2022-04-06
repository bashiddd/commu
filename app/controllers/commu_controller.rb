class CommuController < ApplicationController
  before_action :authenticate_user, {only: [:top]}

  def top
  end

  def new
    @commu = Community.new
  end

  def create
    @commu = Community.new(
      name: params[:name],
      genre: params[:genre],
      area: params[:area],
      detail: params[:detail],
      image_name1: params[:image1],
      image_name2: params[:image2],
      image_name3: params[:image3]
    )
    
    if @commu.save
      flash[:notice] = "コミュニティの作成が完了しました"
      redirect_to("/commu/#{@commu.id}")
    else
      render("commu/new")
    end

    @commu.image_name1 = "#{@commu.id}.jpg"
    image1 = params[:image1]
    File.binwrite("public/commu_images1/#{@commu.image_name1}", image1.read)

    @commu.image_name2 = "#{@commu.id}.jpg"
    image2 = params[:image2]
    File.binwrite("public/commu_images2/#{@commu.image_name2}", image2.read)
    
    @commu.image_name3 = "#{@commu.id}.jpg"
    image3 = params[:image3]
    File.binwrite("public/commu_images3/#{@commu.image_name3}", image3.read)
    
    @commu.save
    
  end

  def show
    @commu = Community.find_by(id: params[:id])
  end

end
