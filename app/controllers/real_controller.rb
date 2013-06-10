class RealController < ApplicationController
	#$adminflag = "false"
	#$userflag = "false"
	$userid = 0
	
	def contactmail
		if params[:commit] == "send" then
				Properties.find_by_sql(["INSERT INTO contactmail_"+$master_user_id.to_s+"(name,email,phone,property_type,sub_property_type,purpose,bed_room,price_limit,location) VALUES (?,?,?,?,?,?,?,?,?)" ,params[:name],params[:email],params[:phone],params[:propertytype],params[:subpropertytype],params[:purpose],params[:bedroom],params[:price],params[:location]])
				
				UserMailer.req($c_email,params[:name],params[:email],params[:phone],params[:propertytype],params[:subpropertytype],params[:purpose],params[:bedroom],params[:price],params[:location]).deliver
				flash[:notice] = "#{'We accept your request,we will contact you ' }"
				
			end
		redirect_to :controller=>$master_user_name, :action => 'contact'	
	end
	
	def admin_contact
		if params[:commit] == "upload" then
					contant=params[:contant]
					email=params[:email]
				 User.find_by_sql(["UPDATE mastercontacts SET content=?,email=? WHERE user_id=?",contant,email,$master_user_id])	
				# Storiess.create(:name =>params[:name],:email =>params[:email],:story =>params[:story],:image =>@path1,:phone=>params[:phone],:user_id=>@a)
							c_detail=Mastercontact.find_by_user_id($master_user_id)
							$c_contant=c_detail.content
							$c_email=c_detail.email
							
			#redirect_to :action => 'contact'
			 redirect_to :controller=>$master_user_name, :action => 'contact'
			end
		end
		def admin_stories
		if params[:commit] == "upload" then
					content=params[:contant]
					
				 User.find_by_sql(["UPDATE masterstories SET content=? WHERE user_id=?",content,$master_user_id])	
				# Storiess.create(:name =>params[:name],:email =>params[:email],:story =>params[:story],:image =>@path1,:phone=>params[:phone],:user_id=>@a)
							s_detail=Masterstorie.find_by_user_id($master_user_id)
							$s_contant=s_detail.content
			#redirect_to :action => 'story'
			 redirect_to :controller=>$master_user_name, :action => 'story'
			end
		end
	
	
	
	def adminhome_edit
		
		#@a=params[:id]
		@t=Masterhome.find_by_sql(["select * from masterhomes where user_id = ?  ", $master_user_id])
		
		
		
		#render :layout => "adminhome"
	end
	
	def basic_view
	
	
													if Masterhome.find_by_c_name(params[:id]).nil? then 
                                                       flash[:notice] = "#{'There  is no shop with this name ' }"
													   $userflag="false"
													   $z=Masterhome.find_by_c_name(params[:id])
													   
                                                       redirect_to :action => 'homesearch'
                                                       
                                                       else 
                                                       $userflag="false"
                                                       $master_user_id=(Masterhome.find_by_c_name(params[:id])).user_id
													   $master_user_name = (Masterhome.find_by_c_name(params[:id])).c_name
                                                       
                                                       
                                                       h_detail=Masterhome.find_by_user_id($master_user_id)
                                                       c_detail=Mastercontact.find_by_user_id($master_user_id)
                                                       s_detail=Masterstorie.find_by_user_id($master_user_id)
                                                       $slider_1=h_detail.slider_img_1
                                                       $slider_2=h_detail.slider_img_2
                                                       $slider_3=h_detail.slider_img_3
                                                       $logo=h_detail.logo
                                                       $company_image_1=h_detail.c_img_1
                                                       $company_image_2=h_detail.c_img_2
                                                       $company_name=h_detail.c_name
                                                       $address=h_detail.address
                                                       $phone=h_detail.phone
                                                       $c_contant=c_detail.content
                                                       $c_email=c_detail.email
                                                       $s_contant=s_detail.content
                                                       redirect_to :controller=>$master_user_name, :action => 'home'
                                                       
                                                       end
                                               
               end
	
	
	def fst
		render :layout => "front"
	end
	
	
	def previewhome
	
		if params[:commit] == "save" then
			Masterhome.find_by_sql(["UPDATE masterhomes SET c_name=?,phone=?,address=?,logo=?,slider_img_1=?,slider_img_2=?,slider_img_3=?,c_img_1=?,c_img_2=? WHERE user_id=?",$company_name,$phone,$address,$logo,$logo,$slider_2,$slider_3,$company_image_1,$company_image_2,$master_user_id])	
			redirect_to :controller=>$master_user_name, :action => 'adminhome'
		end
		
	end
	
	def adminhome
	
		if params[:commit] == "preview" then
		
			$company_name = params[:company]
				$phone = params[:phone]
				$address = params[:address]
				
			
				
			
				if !params[:upload].blank? then
					if name = params[:upload][:file].original_filename then
						directory = "public/images/"
						@path = File.join(directory, name)
						File.open(@path, "wb") { |f| f.write(params[:upload][:file].read) }
						flash[:notice] = "File uploaded"
						@path = File.join("/images/", name)
						$logo = @path
					end
				end
					
			
				if !params[:upload1].blank? then
					if 	name = params[:upload1][:file1].original_filename then
						directory = "public/images/" 			
						@path = File.join(directory, name)
						File.open(@path, "wb") { |f| f.write(params[:upload1][:file1].read) }
						flash[:notice] = "File uploaded"
						@path1 = File.join("/images/", name)
						$slider_1 = @path1
					end
				end
					
				
				
				if !params[:upload2].blank? then
					if	name = params[:upload2][:file2].original_filename then
						directory = "public/images/"
						@path = File.join(directory, name)
						File.open(@path, "wb") { |f| f.write(params[:upload2][:file2].read) }
						flash[:notice] = "File uploaded"
						@path2 = File.join("/images/", name)
						$slider_2 = @path2
					
					end
				end
				
				if !params[:upload3].blank? then
					if name = params[:upload3][:file3].original_filename then
						directory = "public/images/"
						@path = File.join(directory, name)
						File.open(@path, "wb") { |f| f.write(params[:upload3][:file3].read) }
						flash[:notice] = "File uploaded"
						@path3 = File.join("/images/", name)
						$slider_3 = @path3
						
					end
				end
				
				if !params[:upload4].blank? then
				
					if name = params[:upload4][:file4].original_filename then
						directory = "public/images/"
						@path = File.join(directory, name)
						File.open(@path, "wb") { |f| f.write(params[:upload4][:file4].read) }
						flash[:notice] = "File uploaded"
						@path4 = File.join("/images/", name)
						$company_image_1 = @path4
					end
				end
					
				if !params[:upload5].blank? then	
				
					if name = params[:upload5][:file5].original_filename then
					
						directory = "public/images/"
						@path = File.join(directory, name)
						File.open(@path, "wb") { |f| f.write(params[:upload5][:file5].read) }
						flash[:notice] = "File uploaded"
						@path5 = File.join("/images/", name)
						$company_image_2 = @path5
					end
				end		
				
				 redirect_to :controller=>$master_user_name, :action => 'previewhome'
		
			
		
		
		else
		
		
			render :layout => "adminhome"
			
			
			if params[:commit] == "submit" then
				company = params[:company]
				phone = params[:phone]
				address = params[:address]
				
			
				
			
				if !params[:upload].blank? then
					if name = params[:upload][:file].original_filename then
						directory = "public/images/"
						@path = File.join(directory, name)
						File.open(@path, "wb") { |f| f.write(params[:upload][:file].read) }
						flash[:notice] = "File uploaded"
						@path = File.join("/images/", name)
						logo = @path
					end
				end
					
			
				if !params[:upload1].blank? then
					if 	name = params[:upload1][:file1].original_filename then
						directory = "public/images/" 			
						@path = File.join(directory, name)
						File.open(@path, "wb") { |f| f.write(params[:upload1][:file1].read) }
						flash[:notice] = "File uploaded"
						@path1 = File.join("/images/", name)
						image1 = @path1
					end
				end
					
				
				
				if !params[:upload2].blank? then
					if	name = params[:upload2][:file2].original_filename then
						directory = "public/images/"
						@path = File.join(directory, name)
						File.open(@path, "wb") { |f| f.write(params[:upload2][:file2].read) }
						flash[:notice] = "File uploaded"
						@path2 = File.join("/images/", name)
						image2 = @path2
					
					end
				end
				
				if !params[:upload3].blank? then
					if name = params[:upload3][:file3].original_filename then
						directory = "public/images/"
						@path = File.join(directory, name)
						File.open(@path, "wb") { |f| f.write(params[:upload3][:file3].read) }
						flash[:notice] = "File uploaded"
						@path3 = File.join("/images/", name)
						image3 = @path3
						
					end
				end
				
				if !params[:upload4].blank? then
				
					if name = params[:upload4][:file4].original_filename then
						directory = "public/images/"
						@path = File.join(directory, name)
						File.open(@path, "wb") { |f| f.write(params[:upload4][:file4].read) }
						flash[:notice] = "File uploaded"
						@path4 = File.join("/images/", name)
						image4 = @path4
					end
				end
					
				if !params[:upload5].blank? then	
				
					if name = params[:upload5][:file5].original_filename then
					
						directory = "public/images/"
						@path = File.join(directory, name)
						File.open(@path, "wb") { |f| f.write(params[:upload5][:file5].read) }
						flash[:notice] = "File uploaded"
						@path5 = File.join("/images/", name)
						image5 = @path5
					end
				end
					
					
					Masterhome.find_by_sql(["UPDATE masterhomes SET c_name=?,phone=?,address=?,logo=?,slider_img_1=?,slider_img_2=?,slider_img_3=?,c_img_1=?,c_img_2=? WHERE user_id=?",company,phone,address,logo,image3,image4,image5,image1,image2,$master_user_id])	
					
			end
	
		if params[:commit]=="Save" then
		
		
						connection = ActiveRecord::Base.connection();
                        #@t= "select * from properties_" + $master_user_id.to_s+ " where sub_user_id = "+params[:loginid]
                       member=connection.execute("select * from masterhomes where user_id ="+ $master_user_id.to_s)
		
			#@x = Masterhome.find_by_sql(["select * from masterhomes where user_id = ?  ", $master_user_id])
		
			logo = member[0][4]
			slider_img_1 = member[0][5]
			slider_img_2 = member[0][6]
			slider_img_3 = member[0][7]
			c_img_1 = member[0][8]
			c_img_2 = member[0][9]
			
			
			if !params[:upload].blank?
				 if name = params[:upload][:file].original_filename  then
				
				directory = "public/images/"
				@path = File.join(directory, name)
				File.open(@path, "wb") { |f| f.write(params[:upload][:file].read) }
				flash[:notice] = "File uploaded"
				@path = File.join("/images/", name)
				logo = @path
				end
			end
			
			
			if !params[:upload1].blank?
				if name = params[:upload1][:file1].original_filename then
					directory = "public/images/"
					@path = File.join(directory, name)
					File.open(@path, "wb") { |f| f.write(params[:upload1][:file1].read) }
					flash[:notice] = "File uploaded"
					@path1 = File.join("/images/", name)
					slider_img_1 = @path1
				end
			end
		
		
			if !params[:upload2].blank?
				 if name = params[:upload2][:file2].original_filename then
			
					directory = "public/images/"
					@path = File.join(directory, name)
					File.open(@path, "wb") { |f| f.write(params[:upload2][:file2].read) }
					flash[:notice] = "File uploaded"
					@path2 = File.join("/images/", name)
					slider_img_2 = @path2
				end
			end
		
		
			if !params[:upload3].blank?
				if name = params[:upload3][:file3].original_filename  then
					directory = "public/images/"
					@path = File.join(directory, name)
					File.open(@path, "wb") { |f| f.write(params[:upload3][:file3].read) }
					flash[:notice] = "File uploaded"
					@path3 = File.join("/images/", name)
					slider_img_3 = @path3
				end
			end
			
			
			
			if !params[:upload4].blank?
				 if name = params[:upload4][:file4].original_filename  then
					directory = "public/images/"
					@path = File.join(directory, name)
					File.open(@path, "wb") { |f| f.write(params[:upload4][:file4].read) }
					flash[:notice] = "File uploaded"
					@path4 = File.join("/images/", name)
					c_img_1 = @path4
				end
			end
			
			
			if !params[:upload5].blank?
				if name = params[:upload5][:file5].original_filename then
					directory = "public/images/"
					@path = File.join(directory, name)
					File.open(@path, "wb") { |f| f.write(params[:upload5][:file5].read) }
					flash[:notice] = "File uploaded"
					@path5 = File.join("/images/", name)
					c_img_2 = @path5
				end
			end
		
			Masterhome.find_by_sql(["update masterhomes set c_name = ?, address = ?,phone=? ,logo = ?, slider_img_1 = ?,slider_img_2 = ?,slider_img_3 = ?, c_img_1 = ?, c_img_2 = ? where user_id = ? ",params[:companyname],params[:address],params[:phone],logo,slider_img_1,slider_img_2,slider_img_3,c_img_1,c_img_2,$master_user_id])
			
		end

		if params[:commit] == "upload" then
			name = params[:upload][:file].original_filename
			directory = "public/images/"
			@path = File.join(directory, name)
			File.open(@path, "wb") { |f| f.write(params[:upload][:file].read) }
			flash[:notice] = "File uploaded"
			@path = File.join("/images/", name)
			$img = @path
			
			$d = params[:d]
			
			Masterhome.find_by_sql(["update masterhomes set company_img = ?, company_detail = ?  where user_id = ? ",[$img],[$d],[$master_user_id]])
			
		end
	end
	
	end
	
	
	def admin
		
	render  :layout => "front"
		
			
		end
		
	
  
	def home
		
		
		
		#@t = Masterhome.find_by_sql(["select * from masterhomes where user_id = ?  ", $master_user_id])
			
		#$u = Mastercontact.find_by_sql(["select * from mastercontacts where user_id = ?  ", $master_user_id])
		#$v = Masterstorie.find_by_sql(["select * from masterstories where user_id = ?  ", $master_user_id])
		connection = ActiveRecord::Base.connection();
		s="SELECT * FROM properties_" + $master_user_id.to_s + " ORDER BY created_at DESC"
                       
                               @t=connection.execute(s)
		
		if params[:commit] == "login" then
			
			if member = Adminlogin.find_by_loginid(params[:loginid])

				if member.password == params[:password]
			
					@q = 22
					$adminflag="true"
					redirect_to :controller=>$master_user_name, :action => 'home'		
				end
			else
		
				flash[:notice] = "#{'Please fill Login details'}"
				render "login"
			 
			end
		end

	end
	def login
	
	end
	
	
		def contact
			if params[:commit] == "submit" then
				Properties.find_by_sql(["INSERT INTO contactpeople_"+$master_user_id.to_s+"(name,email,phone,message) VALUES (?,?,?,?)",params[:name],params[:email],params[:phone],params[:message]])
				#Contactperson.create(:name =>params[:name],:email =>params[:email],:message =>params[:message],:phone=>params[:phone])
				UserMailer.contact_request($c_email, params[:name],params[:email],params[:phone],params[:message]).deliver
				flash[:notice] = "#{'We accept your request,we will contact you ' }"
				
			end
		end
	
		def contaview
		connection = ActiveRecord::Base.connection();
				@t=connection.execute("select * from contactpeople_"+$master_user_id.to_s)
			if params[:commit] == "viewall" then
				#@t=Contactperson.all
				connection = ActiveRecord::Base.connection();
				@t=connection.execute("select * from contactpeople_"+$master_user_id.to_s)
			end
			if params[:name]=="deletecontact"
			connection = ActiveRecord::Base.connection();
				connection.execute("DELETE FROM contactpeople_" +$master_user_id.to_s+" WHERE message="+"'" +(params[:message].to_s)+ "'")
				#redirect_to :action => 'contaview'
				redirect_to :controller=>$master_user_name, :action => 'contaview'
			end
			
		end
  	
	def listing
	
		@click = params[:click]
		@p_id=params[:p_id]
        @img=params[:img]
        @price=params[:price]
        @bed=params[:bed]
        @nam=params[:nam]
        @purpose=params[:purpose]
        @type=params[:type]
		$propid = params[:proid]
    end
	
	def about
		render :layout => "front"
		
		
		
	end
	
	def aboutus
	
		connection = ActiveRecord::Base.connection();
		@t=connection.execute("SELECT company_img,company_detail FROM masterhomes where user_id ="+$master_user_id.to_s )
			
		
	end
	
	def story
	
		#@t=Storiess.all
			connection = ActiveRecord::Base.connection();
				@t=connection.execute("select * from storiesses_" +$master_user_id.to_s)
			if params[:commit] == "upload" then
				name = params[:upload][:file].original_filename
				directory = "public/images/"
				@path = File.join(directory, name)
				File.open(@path, "wb") { |f| f.write(params[:upload][:file].read) }
				flash[:notice] = "File uploaded"
				@path1 = File.join("/images/", name)
			
				  Properties.find_by_sql(["INSERT INTO storiesses_"+$master_user_id.to_s+"( sub_user_id,name,email,phone,story,image) VALUES (?,?,?,?,?,?)",$userid,params[:name],params[:email],params[:phone],params[:story],@path1])
					
				 #Storiess.create(:name =>params[:name],:email =>params[:email],:story =>params[:story],:image =>@path1,:phone=>params[:phone],:user_id=>@a)
			end
		
	end
	
	def adminstorydelete
		
	
		if params[:name] == "deletestory"
			Stori.find_by_sql(["DELETE FROM storis WHERE id= ?",[params[:s_id]]])
			@l=22
		redirect_to :controller=>$master_user_name, :action => 'story'
		#,:name=>"addlist"
		
		end
	end
	
    def storyview
		
		connection = ActiveRecord::Base.connection();
				@t=connection.execute("SELECT * FROM storiesses_"+ $master_user_id.to_s )
		if params[:mystories]=="mystories" then
			connection = ActiveRecord::Base.connection();
				#@t=Storiess.find_by_sql(["select * from  storiesses  WHERE user_id=?",$userid])
				@t=connection.execute("SELECT * FROM storiesses_"+ $master_user_id.to_s+" where sub_user_id ="+$userid.to_s )
				
			end
			if params[:commit] == "viewall" then
				#@t= Storiess.all
				#s=SELECT * FROM storiesses_" + $master_user_id.to_s 
			connection = ActiveRecord::Base.connection();
				@t=connection.execute("SELECT * FROM storiesses_"+ $master_user_id.to_s )
			end
	end
       
    def storyparticular
		
	
			@u_id=params[:u_id]
			@s_id=params[:s_id]
            @a=params[:name]
			connection = ActiveRecord::Base.connection();
			@t=connection.execute("SELECT * FROM storiesses_"+ $master_user_id.to_s+" where story_id="+ @s_id.to_s )
    end
	
	 def adminstorydelete
       
               if params[:name] == "deletestory"
			    connection = ActiveRecord::Base.connection();
				    Properties.find_by_sql("DELETE FROM storiesses_" +$master_user_id.to_s + "  WHERE story_id="+ params[:s_id].to_s)
					
                      # Storiess.find_by_sql(["DELETE FROM storiesses   WHERE id= ?",[params[:s_id]]])
                     
               redirect_to :controller=>$master_user_name, :action => 'story'
              
               
               end
       end
		
	
	def search
		
		connection = ActiveRecord::Base.connection();
				@t=connection.execute("SELECT * FROM properties_" +$master_user_id.to_s + " ORDER BY updated_at ASC")
				
		
		if params[:commit] == "Submit" then
				
				s="select * from properties_" +$master_user_id+ " where "	
				if params[:id]== "State" then

				else
					s=s+" state= "+  "\""+params[:id]+"\""+" and "
				end 
				if params[:i]== "Property_ID" then

				else
					s=s+"  property_id="+ params[:i]+" and "
				end
				case params[:price][:item_type]
					when '1'
						
					when '2'
						s= s+ " price BETWEEN 100 AND 300 and
"
					when '3'
						s= s+" price BETWEEN 300 AND 600 and "
					
					when '4'
						s= s+" price BETWEEN 600 AND 900 and "
					when '5'
						s= s+" price >900 and "
						
				end
				case params[:property_type][:item_type]
					when '1'
						
					when '2'
						s= s+ " property_type= "+  "\""+"commercial"+"\""+"  and"
						@pt="commercial"
					when '3'
						s= s+" property_type= "+  "\""+"industrial"+"\""+"  and"
						@pt="industrial"
					when '4'
						s= s+" property_type= "+  "\""+"land"+"\""+"  and"
						@pt="Land"
					when '5'
						s= s+" property_type= "+  "\""+"residential"+"\""+"  and"
						@pt="Residential"
						
				end
				case params[:bed_room][:item_type]
					when '1'
						
					when '2'
						s= s+ " bedroom= 1" + " and"
					when '3'
						s= s+ " bedroom=  2" +" and"  
					
					when '4'
						s= s+" bedroom=  3"+ " and"
					when '5'
						s= s+" bedroom >=  4"+  " and"
						
				end
				s=s+"   1=1"
				@t =s
					connection = ActiveRecord::Base.connection();
					@t=connection.execute(s)
				#@t=Properties.find_by_sql(s)
				s=0
				@t.each do |i|

					s=s+1
				end
				@s=s
				$l=@t
			end
	
	
	
		if params[:name]== "Residential" then 
			 s= "select * from properties_" + $master_user_id.to_s+ " where property_type = 'residential'"
       connection = ActiveRecord::Base.connection();
				@t=connection.execute(s)
				#@t=Properties.find_by_sql(s)
				s=0
				@t.each do |i|

					s=s+1
				end
				@s=s
				@pt="Residential "
				$l=@t
			end
			if params[:name]== "Industrial" then 
			 s= "select * from properties_" + $master_user_id.to_s+ " where property_type = 'industrial'"
				connection = ActiveRecord::Base.connection();
				@t=connection.execute(s)
				#@t=Properties.find_by_sql(s)
				s=0
				@t.each do |i|

					s=s+1
				end
				@s=s
				@pt="Industrial "
				$l=@t
			end
			if params[:name]== "Land" then 
			 s= "select * from properties_" +  $master_user_id.to_s+ " where property_type = 'Land'"
				connection = ActiveRecord::Base.connection();
				@t=connection.execute(s)
				#@t=Properties.find_by_sql(s)
				s=0
				@t.each do |i|

					s=s+1
				end
				@s=s
				@pt="Land "
				$l=@t
			end
			if params[:name]== "Commercial" then 
				s= "select * from properties_" + $master_user_id.to_s+ " where property_type = 'commercial'"
				connection = ActiveRecord::Base.connection();
				@t=connection.execute(s)
				#@t=Properties.find_by_sql(s)
				s=0
				@t.each do |i|

					s=s+1
				end
				@s=s
				@pt="Commercial "
				$l=@t
			end
			
	
		if params[:name]=="search"
			connection = ActiveRecord::Base.connection();
				@t=connection.execute("SELECT * FROM properties_" +$master_user_id.to_s + " ORDER BY updated_at ASC")
				#@t=Properties.find_by_sql("SELECT * FROM properties_" +$master_user_id.to_s + " ORDER BY updated_at ASC" )
				s=0
				@t.each do |i|

					s=s+1
				end
				@s=s
				@pt="Latest Properties "
				$l=@t
			end
	 
		
	 
	
		if params[:commit] == "find" then
				
				@t = $l
				@array = []
				@arr = []
				if params[:sale_checkbox] == "sale" then
					@t.each do |i|
						if i[5] == "sale"
							@arr << i
						
						end
					end
					@t = @arr
				end
				if params[:rental_checkbox] == "rental" then
					@t.each do |m|				
				
						if m[5] == "rental"
							@arr << m
						end
					end
					@t = @arr
				end
				
				if params[:condo_checkbox] == "condo" ||  params[:appartment_checkbox] == "appartment" || params[:duplex_checkbox] == "duplex" || params[:triplex_checkbox] == "triplex"
						
					if params[:condo_checkbox] == "condo" then
						@t.each do |m|	
							
							if m[8] == "condo"
								@array << m
								@pt="Condo "
							end
							
						end
					end
					
					if params[:appartment_checkbox] == "appartment" then
						@t.each do |m|					
							if m[8] == "appartment"
								@array << m	
							end
								
						end
						
					end
					
					if params[:duplex_checkbox] == "duplex" then
						@t.each do |m|				
							if m[8] == "duplex"
								@array << m
							end
						end
					end
					
					if params[:triplex_checkbox] == "triplex" then
						@t.each do |m|				
							if m[8] == "triplex"
								@array << m
							end
							
						end
					end
					@t=@array
					
				end	
			end
	
		if params[:commit] == "reset" then
			render :partial => 'search'
			#render search
		end
	
	end
			
	
	def homesearch
	render :layout => "front"
#	connection = ActiveRecord::Base.connection();
#	@t=connection.execute("SELECT * FROM contactmail_11 ")
	#connection = ActiveRecord::Base.connection();
		#$z=connection.execute("select * from contactpeople_50")
	
#	@z=connection.execute("select * from storiesses_18")
			#	@z=connection.execute("select * from storiesses_" +$master_user_id.to_s + " where sub_user_id ="+ $userid.to_s)
			
		#	name=connection.execute("select name from users_" +$master_user_id.to_s + " where sub_user_id ="+ $userid.to_s)
			
		#	@property=connection.execute("select * from properties_" +$master_user_id.to_s + " where property_id =3")
			
			
	#Muser.create(:master_user_id => 1,:shop_name => "abc",:password=>"password",:master_email=>"sharmavikrant14@gmail.com")
	 #connection = ActiveRecord::Base.connection();
	
	#@t=connection.execute("select * from users_18")
	#connection = ActiveRecord::Base.connection();
	#			@t=connection.execute("SELECT * FROM properties_" +$master_user_id.to_s + " ORDER BY updated_at ASC")
	
	#connection = ActiveRecord::Base.connection();
	#			@t=connection.execute("SELECT * FROM properties_" +$master_user_id.to_s + " ORDER BY updated_at ASC")
	#h_detail = Masterhome.find_by_user_id($uid)
	#					c_detail = Mastercontact.find_by_user_id($uid)
	#					s_detail = Masterstorie.find_by_user_id($uid)
						
		
		#Masterstorie.find_by_sql("DELETE FROM masterstories")
		#Mastercontact.find_by_sql("DELETE FROM mastercontacts")
		
		#@t=Storiess.find_by_sql("UPDATE storis SET user_id=4 WHERE id=4")
		#Properties.find_by_sql( "update properties set sub_property_type='condo',contant='details related to this property id 4 '   where property_id=1")
	end
	
	def signup
		
	end
	
	def mystory
		
		$master_user_id
		@t =  Stori.find_by_sql(["select * from storis where user_id = ?  ", $master_user_id])
		#@t =  Stori.find_by_sql(["select * from storis"])
		@x = 22
		#redirect_to :action => 'storyview'
	end
	
	
	def userlog
		
		if params[:commit]== "submit" then
				connection = ActiveRecord::Base.connection();
				member=connection.execute("select * from musers where shop_name="+"'"+params[:shopname].to_s+"'")
					if 	member[0]==nil  then
					flash[:notice] = "#{'There is no shop with this name'}"					
								redirect_to :action => 'userlog' , :layout => 'front'
					else
					member=connection.execute("select * from musers where shop_name="+"'"+params[:shopname].to_s+"'")
						if   member[0][2]==params[:password]
							if member[0][4]=="t" then
								#$userid=params[:loginid]
								$adminflag="true"
								$master_user_id=member[0][0]
								
								
								h_detail = Masterhome.find_by_user_id($master_user_id)
						c_detail = Mastercontact.find_by_user_id($master_user_id)
						s_detail = Masterstorie.find_by_user_id($master_user_id)
						
						
													   $slider_1=h_detail.slider_img_1
                                                       $slider_2=h_detail.slider_img_2
                                                       $slider_3=h_detail.slider_img_3
                                                       $logo=h_detail.logo
                                                       $company_image_1=h_detail.c_img_1
                                                       $company_image_2=h_detail.c_img_2
                                                       $company_name=h_detail.c_name
                                                       $address=h_detail.address
                                                       $phone=h_detail.phone
                                                       $c_contant=c_detail.content
                                                       $c_email=c_detail.email
                                                       $s_contant=s_detail.content
						
								 redirect_to :controller=>member[0][1], :action => 'adminhome', :layout => 'adminhome'
								#redirect_to :action => 'adminhome'
							else
								flash[:notice] = "#{'you need to varify your Email id before login'}"					
								#redirect_to :action => 'admin'
							 redirect_to :controller=>$master_user_name, :action => 'userlog', :layout => 'front'
							end
						else
							flash[:notice] = "#{'Invalid Password details'}"					
							#redirect_to :action => 'admin'
							 redirect_to :controller=>$master_user_name, :action => 'userlog', :layout => 'front'
						end
					
					
					end		
			else
			
			
			render :layout => 'front'
			end
							
		end
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	def userlogin
		
		if params[:commit] == "upload" then
			@l = Muser.last
			@a = @l.master_user_id
			
			if @a == 'nil' then
				@a = 0
			end
			
			@a += 1
	
			
			$q= params[:password]
			$r= params[:confirmpassword]
			@pwd = params[:password]
			@shopname = params[:name]
			@email = params[:email]
			if $q == $r then
				 Muser.create(:master_user_id => @a,:shop_name => params[:name],:password=>params[:password],:master_email=>params[:email])
				 UserMailer.welcome_email( @a,@pwd,@shopname,@email).deliver
				 
			end
			
			
			flash[:notice] = "#{'Your account created successfully and your user id  =' + @a.to_s()}"
		end
		
	
			
				
	
	end
	
	
	def ulogin
		
		if params[:commit] == "upload" then
			@l = User.last
			@a = @l.user_id
			
			if @a == 'nil' then
				@a = 0
			end
			
			@a += 1
	
			
			$q= params[:password]
			$r= params[:confirmpassword]
			@pwd = params[:password]
			@name = params[:name]
			@email = params[:email]
			if $q == $r then
				 User.create(:user_id => @a,:name => params[:name],:password=>params[:password],:email=>params[:email])
				 UserMailer.welcome_email( @a,@pwd,@name,@email).deliver
				 
			end
			
			
			flash[:notice] = "#{'Your account created successfully and your user id  =' + @a.to_s()}"
		end
		
		if params[:commit] == "submit" then
			if member = User.find_by_user_id(params[:loginid]) then
			
				if member.password == params[:password] then
				
					if member.validate == true
						$userflag= "true"
						$master_user_id = params[:loginid]
						
						h_detail = Masterhome.find_by_user_id($uid)
						c_detail = Mastercontact.find_by_user_id($uid)
						s_detail = Masterstorie.find_by_user_id($uid)
						
						
													   $slider_1=h_detail.slider_img_1
                                                       $slider_2=h_detail.slider_img_2
                                                       $slider_3=h_detail.slider_img_3
                                                       $logo=h_detail.logo
                                                       $company_image_1=h_detail.c_img_1
                                                       $company_image_2=h_detail.c_img_2
                                                       $company_name=h_detail.c_name
                                                       $address=h_detail.address
                                                       $phone=h_detail.phone
                                                       $c_contant=c_detail.content
                                                       $c_email=c_detail.email
                                                       $s_contant=s_detail.content
						
						
						redirect_to :controller=>$master_user_name, :action => 'home'
					else
						flash[:notice] = "#{'Please confirm your id from your mail'}"
						redirect_to :controller=>$master_user_name, :action => 'ulogin'
					
					end
				else
			
					flash[:notice] = "#{'Please enter password'}"
					redirect_to :controller=>$master_user_name, :action => 'ulogin'
			 
				end
			else
				flash[:notice] = "#{'Please fill Login details'}"
					redirect_to :controller=>$master_user_name, :action => 'ulogin'
			
			end
		end
	end
	
	def userlogout
		
		$master_user_id = 0
		$userflag= "false"
		redirect_to :action => 'ulog'
	end
	
	def login
		if params[:commit] == "login" then
			
			if member = Adminlogin.find_by_loginid(params[:loginid])

				if member.password == params[:password]
			
					@q = 22
					$adminflag="true"
				
				end
			else
		
				flash[:notice] = "#{'Please fill Login details'}"
				render "login"
			 
			end
		end
		
		if params[:g] == "h"
			$adminflag="false"
		end
		if params[:commit] == "upload" then
			@n = 55
			$q= params[:currentpwd]
			$p= params[:newpwd]
			
			if   member = Adminlogin.find_by_password(params[:currentpwd])
				Adminlogin.find_by_sql(["update adminlogins set password = ? where password = ? ",[$p],[$q]])
			end
		end
	end
	
	def logout
		
		$adminflag="false"
		redirect_to :controller=>$master_user_name, :action => 'home'
		#render "login"
	end
	
	def adminlogin
		
		if params[:commit] == "login" then
			if   member = Adminlogin.find_by_loginid(params[:loginid]) && pwd = Adminlogin.find_by_password(params[:password])
				@q = 22
				$adminflag="true"
			else
				flash[:notice] = "Welcome! We just delivered a welcome package to your email"
				render "login"
			end
		end
	end
	
	def user_validate
				$master_user_id = params[:uid]
				
				$master_user_name = params[:shopname]
               #@t=params[:uid]
                Muser.find_by_sql(["UPDATE musers SET validate=? WHERE master_user_id=?",true,params[:uid]])
				 Masterhome.create(:user_id=>params[:uid],:c_name=>params[:shopname],:phone=>"0000000000000",:address=>"Company Address ",:logo=>"/images/filter-house.png",:slider_img_1=>"/images/101.jpg",:slider_img_2=>"/images/101.jpg",:slider_img_3=>"/images/101.jpg",:c_img_1=>"/images/101.jpg",:c_img_2=>"/images/101.jpg") 
				 Mastercontact.create(:user_id =>params[:uid],:content=>"Write some conatnt for your user",:email=>"contant person email")
				 Masterstorie.create(:user_id =>params[:uid],:content=>"Write some conatnt for your user")
				
				 
				 connection = ActiveRecord::Base.connection();
			s="CREATE TABLE "+ "contactmail_"+$master_user_id.to_s+"(name varchar2(100),email varchar(255),phone varchar(255),property_type varchar(255),sub_property_type varchar(255),purpose varchar(255),bed_room varchar(255), price_limit varchar(255),location varchar(255))"
 connection.execute(s)
				s="CREATE TABLE "+ "contactpeople_"+$master_user_id.to_s+"(name varchar2(100),email varchar(255),phone varchar(255),message varchar(255))"
 connection.execute(s)
s="CREATE TABLE "+ "properties_"+$master_user_id.to_s+"(property_id INTEGER PRIMARY KEY AUTOINCREMENT,property_name varchar(255),price varchar(255),state varchar(255),property_type varchar(255),purpose varchar(255),bedroom int,image varchar(255),sub_property_type varchar(255),contant varchar(255),created_at date,updated_at date)"
	 connection.execute(s)
	s="CREATE TABLE "+ "storiesses_"+$master_user_id.to_s+"(story_id INTEGER PRIMARY KEY AUTOINCREMENT,sub_user_id int,name varchar2(100),email varchar(255),phone varchar(255),story varchar(255),image vaarchar(2))"
	 connection.execute(s)
	s="CREATE TABLE "+ "users_"+$master_user_id.to_s+"( sub_user_id INTEGER PRIMARY KEY AUTOINCREMENT,name varchar2(100),password varchar(255),my_properties varchar(255),email varchar(255),validates boolean )"
 connection.execute(s)
	
		 h_detail=Masterhome.find_by_user_id($master_user_id)
                                                       c_detail=Mastercontact.find_by_user_id($master_user_id)
                                                       s_detail=Masterstorie.find_by_user_id($master_user_id)
                                                       $slider_1=h_detail.slider_img_1
                                                       $slider_2=h_detail.slider_img_2
                                                       $slider_3=h_detail.slider_img_3
                                                       $logo=h_detail.logo
                                                       $company_image_1=h_detail.c_img_1
                                                       $company_image_2=h_detail.c_img_2
                                                       $company_name=h_detail.c_name
                                                       $address=h_detail.address
                                                       $phone=h_detail.phone
                                                       $c_contant=c_detail.content
                                                       $c_email=c_detail.email
                                                       $s_contant=s_detail.content


               redirect_to :controller=>$master_user_name, :action => 'home'
    end
	
	def addproperty
		
	
		if params[:commit] == "upload" then
			name = params[:upload][:file].original_filename
			directory = "public/images/"
			@path = File.join(directory, name)
			File.open(@path, "wb") { |f| f.write(params[:upload][:file].read) }
			flash[:notice] = "File uploaded"
			@path1 = File.join("/images/", name)
				
			$p = params[:propertyid]			
			$q = params[:propertyname]
			$r = params[:price]
			$s = params[:state]
			$t = params[:propertytype]
			$u = params[:purpose]
			$v = params[:subpropertytype]
			$w = params[:bedroom]
			$x = @path1

			# Properties.create(:property_id =>params[:propertyid],:property_name =>params[:propertyname],:price =>params[:price],:state =>params[:state],:property_type =>params[:propertytype],:purpose =>params[:purpose],:sub_property_type =>params[:subpropertytype],:bedroom =>params[:bedroom],:image =>@path1)
				
			Properties.find_by_sql(["insert into properties (name, email, phone, story,created_at,updated_at) values (?,?,?,?,?,?)",[$x],[$y],[$z],[$p],[$q],[$r]])
		end
	end
	
	def addstory
		
		@t=Stori.all
		render  "story"
		#render  "H:\bitnami\programs\reale\app\views\real\story"
	end
	
	def addcontact
		
		@t=Contactpersonss.all
		render  "conta"
	end
	
	def changepwd
		
		@x = params[:currentpwd]
		@y = params[:newpwd]
	end
	
	def admin_property_view
		
		@t=Properties.all
	end
	def property_add
		
		if params[:commit] == "upload" then
		
			name = params[:upload][:file].original_filename
			directory = "public/images/"
			@path = File.join(directory, name)
			File.open(@path, "wb") { |f| f.write(params[:upload][:file].read) }
			flash[:notice] = "File uploaded"
			@path1 = File.join("/images/", name)
			Properties.create(:property_id => params[:propertyid],:property_name=>params[:propertyname],:price=>params[:price],:state=>params[:state],:property_type=>params[:propertytype],:sub_property_type=>params[:subpropertytype],:bedroom=>params[:bedroom],:image=>@path1)
				
		end
	end
		
	def property_edit
		
		@a=params[:id]
		@t=Properties.find_by_sql(["select * from properties where property_id = ?  ", @a])
		
		if params[:commit]=="Save" then
			Properties.find_by_sql(["update properties set property_name = ?, price = ?,state=? ,property_type = ?,purpose = ?, sub_property_type = ? ,bedroom =? where property_id = ? ",params[:propertyname],params[:price],params[:state],params[:propertytype],params[:purpose],params[:subpropertytype],params[:bedroom],params[:propertyid]])
			redirect_to :controller=>$master_user_name, :action => 'admin_property_view'
		end		
	end
		
	def property_delete
		
		@s=params[:id]
		Properties.find_by_sql(["DELETE FROM properties WHERE property_id= ?",[params[:id]]])
		redirect_to :controller=>$master_user_name, :action => 'admin_property_view'
	end
		
	def propertylist
		
		Propertylist.create(:user_id => $master_user_id,:property_id => $propid)
		@t=Properties.all
		flash[:notice] = "#{'Property save successfully'}"
		redirect_to :controller=>$master_user_name, :action => 'search'
	end
	def senddetails
		connection = ActiveRecord::Base.connection();
				email=connection.execute("select email from users_" +$master_user_id.to_s + " where sub_user_id ="+ $userid.to_s)
			#email=(User.find_by_user_id($userid)).email
			#name=(User.find_by_user_id($userid)).name
			name=connection.execute("select name from users_" +$master_user_id.to_s + " where sub_user_id ="+ $userid.to_s)
			#@p_id=params[:p_id]
			#property=Properties.find_by_property_id(@p_id)
			property=connection.execute("select * from properties_" +$master_user_id.to_s + " where property_id ="+ params[:p_id].to_s)
			UserMailer.property_details(property[0], email[0][0],name[0][0]).deliver
			flash[:notice] = "#{'Details of this Property is send to your Email Id ' }"
			
			redirect_to :controller=>$master_user_name, :action => 'search'
		end
	
	def proplist
	#@t=Properties.alls
		
		if params[:name]=="intrested" then 
			email=(User.find_by_user_id($uid)).email
			
			@price = params[:price]
			@bed = params[:bed]
			@nam = params[:nam]
			@purpose = params[:purpose]
			@type = params[:type]
			#@contact = params[:contact]
			@p_id = params[:p_id]
			
			#@x = Properties.find_by_sql(["select * FROM properties WHERE property_id= 1",[params[:p_id]])
			UserMailer.registration_confirmation( @price,@bed,@nam,@purpose,@type,@p_id,email).deliver
			
		end
	
		
		
		if params[:name]=="deleteproperty"
			   connection = ActiveRecord::Base.connection();
					t=connection.execute("select my_properties from users_" +$master_user_id.to_s + " where sub_user_id ="+ $userid.to_s)
                       @x=t[0][0]
                       @a = @x
                       @dl = params[:p_id].to_s
                      
                       if @x != nil then
                                        @a.slice! params[:p_id]+","          
                       end
                       User.find_by_sql(["UPDATE users_" + $master_user_id.to_s+ " SET my_properties=? WHERE sub_user_id=?",@a,$userid])
                               flash[:notice] = "#{'This property is deleted from your list sucessfully' }"
                        redirect_to :controller=>$master_user_name, :action => 'mysearch',:name=>"delete"
                       
               end
               
               if params[:name]=="admindeleteproperty"
                       Properties.find_by_sql(["DELETE FROM properties_" + $master_user_id.to_s+ " WHERE property_id= ?",[params[:p_id]]])
						flash[:notice] = "#{'This property is deleted from your database' }"   
						redirect_to :controller=>$master_user_name, :action => 'search'					
			  end
	
		
	end
		
	
	
	def mysearch
		
		if params[:name]=="addtolist" then 
				if $userid !=0 then 
					connection = ActiveRecord::Base.connection();
					t=connection.execute("select my_properties from users_" +$master_user_id.to_s + " where sub_user_id ="+ $userid.to_s)
					if @x=t[0][0] then 
					@x.slice! ",0"
					
					end
					if @x != nil then			
						@a= @x+","+(params[:p_id])+",0"
					else
						@a= '0'+","+(params[:p_id])
					end
					User.find_by_sql(["UPDATE users_" + $master_user_id.to_s+ " SET my_properties=? WHERE sub_user_id=?",@a,$userid])
					
					flash[:notice] = "#{'This property is added to your list sucessfully' }"
					redirect_to :controller=>$master_user_name,  :action => 'search'
				end
			end
			if params[:name]=="saveproperty"
			
				@t=[]
				@test=[]
				connection = ActiveRecord::Base.connection();
				t=connection.execute("select my_properties from users_" +$master_user_id.to_s + " where sub_user_id ="+ $userid.to_s)
				
				if @a=t[0][0] then 
					@p=@a.split(',')
					@p.each do |i|
						if i!='0'  then 
							@test<<i
							#@t<<Properties.find_by_property_id(i)
							@t<< connection.execute("select * from properties_" +$master_user_id.to_s + " where property_id=" +i)
						end
					end
				end 	
			end		
			if params[:name]=="delete"
				@t=[]
				@test=[]
				connection = ActiveRecord::Base.connection();
				t=connection.execute("select my_properties from users_" +$master_user_id.to_s + " where sub_user_id ="+ $userid.to_s)
				if @a=t[0][0] then 
				@p=@a.split(',')
				@p.each do |i|
					if i!='0'  then 
					@test<<i
						#@t<<Properties.find_by_property_id(i)
						@t<< connection.execute("select * from properties_" +$master_user_id.to_s + " where property_id=" +i)
					end
				end
				end 
			
			end	
	end
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			def admin_property_view
			#@t=Properties.all
			connection = ActiveRecord::Base.connection();
			@t=connection.execute("select * from properties_"+$master_user_id.to_s)
		end
		
		def property_add
		#@test=(["insert into properties (name, email, phone, story,created_at,updated_at) values (?,?,?,?,?,?)",[$x],[$y],[$z],[$p],[$q],[$r]])
			
			if params[:commit] == "upload" then
				name = params[:upload][:file].original_filename
				directory = "public/images/"
				@path = File.join(directory, name)
				File.open(@path, "wb") { |f| f.write(params[:upload][:file].read) }
				
				@path1 = File.join("/images/", name)
				
					#Properties.create(:property_id => params[:propertyid],:property_name=>params[:propertyname],:price=>params[:price],:state=>params[:state],:property_type=>params[:propertytype],:sub_property_type=>params[:subpropertytype],:bedroom=>params[:bedroom],:image=>@path1)
		connection = ActiveRecord::Base.connection();
		Properties.find_by_sql(["INSERT INTO properties_"+$master_user_id.to_s+"(property_name,price,state,property_type,purpose,bedroom,image,sub_property_type,contant,created_at,updated_at) VALUES (?,?,?,?,?,?,?,?,?,?,?)",params[:propertyname],params[:price],params[:state],params[:propertytype],params[:purpose],params[:bedroom].to_i,@path1,params[:subpropertytype],params[:contant],Time.now.strftime("%m/%d/%Y"),Time.now.strftime("%m/%d/%Y")])
		#connection.execute(INSERT INTO properties_+$master_user_id.to_s+(property_id,property_name,price,state,property_type,purpose,bedroom,image,sub_property_type,contant,created_at,updated_at) VALUES +(1,params[:propertyname],params[:price],params[:state],params[:propertytype],params[:purpose],params[:bedroom],@path,params[:subpropertytype],params[:contant])
			
		
			end
		end
		
		def property_edit
			
			#@t=Properties.find_by_sql(["select * from properties_"+$master_user_id.to_s +" where property_id = ?  ", @a])
			if params[:commit]=="Save" then
				Properties.find_by_sql(["update properties_"+$master_user_id.to_s+"  set property_name = ?, price = ?,state=? ,property_type = ?,purpose = ?, sub_property_type = ? ,bedroom =?,contant=? where property_id = ? ",params[:propertyname],params[:price],params[:state],params[:propertytype],params[:purpose],params[:subpropertytype],params[:bedroom],params[:contant],params[:propertyid]])
				redirect_to :controller=>$master_user_name,  :action => 'admin_property_view'
			else	
				@a=params[:id]
				connection = ActiveRecord::Base.connection();
				@t=connection.execute("select * from properties_" +$master_user_id.to_s + " where property_id ="+ @a)
			end
		end
		
		def property_delete
			connection = ActiveRecord::Base.connection();
				@t=connection.execute("DELETE FROM properties_" +$master_user_id.to_s+ " WHERE property_id=" +params[:id])
			#Properties.find_by_sql(["DELETE FROM properties WHERE property_id= ?",[params[:id]]])
			redirect_to :controller=>$master_user_name,  :action => 'admin_property_view'
		end
			
			
			
			
		def ulog	
		
			if params[:commit]== "login" then
				connection = ActiveRecord::Base.connection();
				#@t= "select * from properties_" + $master_user_id.to_s+ " where sub_user_id = "+params[:loginid]
				member=connection.execute("select * from users_" + $master_user_id.to_s+ " where sub_user_id = "+params[:loginid])	
				#$t=connection.execute("select * from users_34")

				if member != nil then
				
					if   member[0][2]==params[:password]
						if member[0][5]=="t" then
							$userid=params[:loginid]
							$userflag="true"
							
							
							redirect_to :controller=>$master_user_name, :action => 'home'
						else
							flash[:notice] = "#{'you need to varify your Email id before login'}"					
							redirect_to :controller=>$master_user_name, :action => 'ulog'
						end
					else
						flash[:notice] = "#{'Invalid Login and Password details'}"					
						redirect_to :controller=>$master_user_name, :action => 'ulog'
					end
				else
						flash[:notice] = "#{'Please enter details properly'}"					
						redirect_to :controller=>$master_user_name, :action => 'ulog'
				end		
			else
			render :layout => 'front'
			end
			
		end
		
		
		
		
		def usersignup
			if params[:commit]=="Submit" then
				if params[:password]==params[:confirmpassword] then 
				    connection = ActiveRecord::Base.connection();
				    Properties.find_by_sql(["INSERT INTO users_"+$master_user_id.to_s+"(name,password,email) VALUES (?,?,?)",params[:name],params[:password],params[:email]])
					#l=(User.last).user_id 	
					#last=l+1	
					#User.create(:user_id =>last ,:name=>params[:name],:password=>params[:password],:email=>params[:email])
					
					@t=connection.execute("SELECT sub_user_id FROM users_" +$master_user_id.to_s+ " WHERE sub_user_id=(SELECT MAX(sub_user_id) FROM users_"+ $master_user_id.to_s+" )")
                                       UserMailer.user_welcome_email(@t[0][0],params[:name],params[:password],params[:email]).deliver
								
				flash[:notice] = "#{'your account is created sucessfully details send to your EMail Id and your login id is = ' }"	
					
				#redirect_to :action => 'ulog'
				else 
					flash[:notice] = "#{'confirm password and Password not match'}"		
				end
			end
		end
		
		def sub_user_validate
		#@t=params[:uid]
		
		# Home.find_by_sql("INSERT INTO human_"+last.to_s+" VALUES (1,'Tom B. Erichsen','Skagen 21','Stavanger','4006')")
		
		#Home.create(:user_id=>params[:uid],:c_name=>"Company_name ",:phone=>"0000000000000",:address=>"Company Address ",:logo=>"/images/01.jpg",:slider_img_1=>"/images/01.jpg",:slider_img_2=>"/images/01.jpg",:slider_3=>"/images/01.jpg",:c_img_1=>"/images/01.jpg",:c_img_2=>"/images/01.jpg") 
		#MContact.create(:user_id =>params[:uid],:contant=>"Write some conatnt for your user",:email=>"sachinsingh.7903@gmail.com")
		#MStories.create(:user_id =>params[:uid],:contant=>"Write some conatnt for your user")		
            connection = ActiveRecord::Base.connection();
   		
		User.find_by_sql(["UPDATE users_" +$master_user_id.to_s + " SET validates=? WHERE sub_user_id=?",true,params[:uid]])
		redirect_to :controller=>$master_user_name, :action => 'ulog'
		end
		
		
	
			
			
			
			
			
			
			
			
			
end
