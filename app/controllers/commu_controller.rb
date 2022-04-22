class CommuController < ApplicationController
  before_action :authenticate_user, {only: [:top]}

  def top
    @commus = Community.all
    @commus_area = @commus.pluck(:area).uniq
    @commus_genre = @commus.pluck(:genre).uniq
  end
  
  def narrow_down
    @commus = Community.all
    @commus_area = @commus.pluck(:area).uniq
    @commus_genre = @commus.pluck(:genre).uniq

    if params[:area]=="すべて" && params[:genre]=="すべて"
      @commus = Community.all
    elsif params[:area]!="すべて" && params[:genre]=="すべて"
      @commus = Community.where(area: params[:area])
    elsif params[:area]=="すべて" && params[:genre]!="すべて"
      @commus = Community.where(genre: params[:genre])
    elsif params[:area]!="すべて" && params[:genre]!="すべて"
      @commus = Community.where(area: params[:area], genre: params[:genre])
    end
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
      image_name3: params[:image3],
      created_by: @current_user.name,
      overview: params[:overview],
      age_gender: params[:age_gender],
      place: params[:place],
      rule: params[:rule]
    )
    
    if @commu.save
      @commu.image_name1 = "#{@commu.id}.jpg"
      image1 = params[:image1]
      File.binwrite("public/commu_images1/#{@commu.image_name1}", image1.read)
      @commu.image_name2 = "#{@commu.id}.jpg"
      image2 = params[:image2]
      File.binwrite("public/commu_images2/#{@commu.image_name2}", image2.read)
      @commu.image_name3 = "#{@commu.id}.jpg"
      image3 = params[:image3]
      File.binwrite("public/commu_images3/#{@commu.image_name3}", image3.read)

      flash[:notice] = "コミュニティの作成が完了しました"
      redirect_to("/commu/#{@commu.id}")
    else
      flash[:notice] = "全て入力してください"
      render("commu/new")
    end

    @commu.save
    
    if @commu.save
      @member = Member.new(commu_id: @commu.id, user_id: @current_user.id)
      @member.save
    end
  end

  def new_reload
    @commu = Community.new(
      name: params[:name],
      genre: params[:genre],
      area: params[:area],
      detail: params[:detail],
      image_name1: params[:image1],
      image_name2: params[:image2],
      image_name3: params[:image3],
      created_by: @current_user.name,
      overview: params[:overview],
      age_gender: params[:age_gender],
      place: params[:place],
      rule: params[:rule]
    )
    
    if @commu.save
      @commu.image_name1 = "#{@commu.id}.jpg"
      image1 = params[:image1]
      File.binwrite("public/commu_images1/#{@commu.image_name1}", image1.read)
      @commu.image_name2 = "#{@commu.id}.jpg"
      image2 = params[:image2]
      File.binwrite("public/commu_images2/#{@commu.image_name2}", image2.read)
      @commu.image_name3 = "#{@commu.id}.jpg"
      image3 = params[:image3]
      File.binwrite("public/commu_images3/#{@commu.image_name3}", image3.read)

      flash[:notice] = "コミュニティの作成が完了しました"
      redirect_to("/commu/#{@commu.id}")
    else
      flash[:notice] = "全て入力してください"
      render("commu/new")
    end

    @commu.save
    
    if @commu.save
      @member = Member.new(commu_id: @commu.id, user_id: @current_user.id)
      @member.save
    end
  end

  def show
    @commu = Community.find_by(id: params[:id])
    @create_user = User.find_by(name: @commu.created_by)
    @number = Member.where(commu_id: @commu.id).count
  end

  def edit
    @commu = Community.find_by(id: params[:id])
  end

  def update
    @commu = Community.find_by(id: params[:id])

    @commu.name = params[:name]
    @commu.genre = params[:genre]
    @commu.area = params[:area]
    @commu.detail = params[:detail]
    @commu.overview = params[:overview]
    @commu.age_gender = params[:age_gender]
    @commu.place = params[:place]
    @commu.rule = params[:rule]
  
    if params[:image1]
      @commu.image_name1 = "#{@commu.id}.jpg"
      image1 = params[:image1]
      File.binwrite("public/commu_images1/#{@commu.image_name1}", image1.read)
    end
    
    if params[:image2]
      @commu.image_name2 = "#{@commu.id}.jpg"
      image2 = params[:image2]
      File.binwrite("public/commu_images2/#{@commu.image_name2}", image2.read)
    end

    if params[:image3]
      @commu.image_name3 = "#{@commu.id}.jpg"
      image3 = params[:image3]
      File.binwrite("public/commu_images3/#{@commu.image_name3}", image3.read)
    end

    if @commu.save
      flash[:notice] = "コミュニティ情報を編集しました"
      redirect_to("/commu/#{@commu.id}")
    else
      render("commu/edit")
    end
    
  end
  

end
