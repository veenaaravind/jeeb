

from django.views.generic import TemplateView # TemplateView is a generic class-based view that helps developers create a view for a specific template.
from django.views.generic import base
from django.views.generic.edit import FormView  # to display and verify a Django Form

from django.shortcuts import (
    render_to_response,
    redirect,
    render,
)  # Combines a given template with a given context dictionary and returns an HttpResponse object with that rendered text.

from django.http import (
    HttpResponse,
    Http404,
    HttpResponseNotAllowed,
    JsonResponse,
) 
import simplejson
from django.db import connection, connections
import os
import numpy as np
import matplotlib.pyplot as plt
from jeeb.settings import *



class index(base.View):
    def get(self, request):
        # return redirect('ocr/filelist')

        return render(request, 'index.html')


def getdatafromdb(request):
	print (">>>>>>>getdatafromdb --->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.",request.POST)
	response = {}
	response['status'] = 1
	response['data'] = {}
	response['data']['new_result'] = []
	response['page_count'] = 1
	response['errorMessages'] = []
	error_message = {}
	try:
		value=request.POST.get('vals')
		fromdate=request.POST.get('fromdate')
		todate=request.POST.get('todate')
		print("hereerrereer",fromdate,todate)

		data_from_dataset="select product_id ,intrest_point from user_data_set where date <= '"+todate+"' and date >= '"+fromdate+"' "
		print(data_from_dataset,'data_from_dataset')

		data_for_date=exec_raw_query_table(data_from_dataset)
		print(data_for_date,'data_for_date')

        
        # new_list=[] # initialize list to store data , having  same date as input date
		# # data --   data  given in task
		# for sub in data :
		# 	if sub['Date'] == str(date_value) :
		# 		new_list.append(sub)
		new_result=[] # list for final result
		for res in data_for_date:
			product_id=res[0] 
			# connected with database , table product
			data_from_table=exec_raw_query_table("select sub_category_id from product where product_id='"+str(product_id)+"'")
			sub_category_id = data_from_table[0][0]
			
			details={}
			details['sub_category_id']=sub_category_id
			details['intrest_point']=int(res[1])

			if details not in new_result:
				# checking whether the same subcategory exist or not
				if not any(d['sub_category_id'] == sub_category_id  for d in new_result):
					new_result.append(details) # if not in result list appeding in to result list
				else:
					for d in new_result:
						if d['sub_category_id'] == sub_category_id :
							# if same subcategory exists in  result list, adding intresting pont  and update the dictionary in the list
							existing_point=d['intrest_point']
							add_point=int(existing_point)+int(res[1])
							d['intrest_point']=add_point
		print('Result Data :',new_result)
		response['data']['new_result'] = new_result

		x=[]
		y=[]
		for new in new_result:
			print(new,'nnnnnnnnnnnn')
			s=new.get('sub_category_id')
			ip=new.get('intrest_point')
			print(s,ip,'aaaaaaaaaa')
			x.append(s)
			y.append(ip)

	
		# x = [0, 1, 2, 3, 4, 5, 6, 7]
		# y = [160, 167, 17, 130, 120, 40, 105, 70]

		plt.bar(x, y)
     
		# calling the function to add value labels
		addlabels(x, y)
		 
		# giving title to the plot
		plt.title("Product usage")
		 
		# giving X and Y labels
		plt.xlabel("Sub category")
		plt.ylabel("intrest point")
		 
		# visualizing the plot
		plt.show()
		# fig, ax = plt.subplots()
		# width = 0.75
		# ind = np.arange(len(y))
		 
		# ax.barh(ind, y, width, color = "green")
		 
		# for i, v in enumerate(y):
		#     ax.text(v + 3, i + .25, str(v),
		#             color = 'blue', fontweight = 'bold')
		# # plt.savefig('my_plot.png')
		# plt.savefig('media/barchart.png')
		# # os.path.join(MEDIA_ROOT , 'my_plot.png')
		# plt.show()

		

		    
		return HttpResponse(simplejson.dumps(response), content_type="application/json")
	except KeyError as error:
		#print (error)
		response['errorMessages'].append(error_message)
		return HttpResponse(simplejson.dumps(response), content_type="application/json")



def exec_raw_query_table(query_string, *query_args):
    # connection= psycopg2.connect(database='assesment', user='postgres', password='123', host='127.0.0.1', port= '5432')
    cursor = connections["default"].cursor()
    cursor.execute(query_string, query_args)
    row = cursor.fetchall()
    return row

def addlabels(x,y):
    for i in range(len(x)):
        plt.text(i,y[i],y[i])