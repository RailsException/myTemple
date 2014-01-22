class FgridreturnsController < ApplicationController
  def getalldonars
  	#@donar = Donar.all
  	 page =params['page'].to_i 
  	 rperpage = params['rp'].to_i
  	unless page > 1
  		#@donar = @donar.limit( params['rp'] )
  		offset = 0
  	else
  		offset = page * rperpage 
  	end

  	if  !params['query'].empty? then 
  	 #	query = params['qtype']  + " like '" + params['query']  +"' LIMIT 10 OFFSET 1"
  	    query = '"'+params['qtype'] + '" LIKE '+ "'%" + params['query'] + "%'"  
  	 	@donar = Donar.where(query).limit(rperpage).offset(offset)
  	 else
  	 	@donar = Donar.limit( rperpage ).limit(rperpage).offset(offset)
  	 end	
  	
  	@dString = ""
  	@donar.each do |d|
  		id = d.id.to_s
  		@dString  +=  '{"id":' + id +',"cell":{"fname":"' + d.fname + '","lname":"' + d.lname + '",'
  		@dString  +=  '"mobile":"' + d.mobile.to_s + '","email":"' + d.emailid + '"'
  		@dString += "}},"
  	end	
  	if @donar.empty?  then  	
  		@dString  = '{"page":"' + params['page'] +'","total":' + params['rp'] +',"rows":[]'		  		
  	else  	
  		@dString  = '{"page":"' + params['page'] +'","total":' + params['rp'] +',"rows":[' + @dString[0,@dString.length-1] + ']'	
  	end 	
  	
  	@dString  += ',"post":"'+ params['page'] + '","rp":"' + params['rp'] +'","sortname":"'+params['sortname']  +'","sortorder":"'+params['sortorder']+'"'  
  	@dString += "}"

  	render json: @dString

  	 
  end
end
