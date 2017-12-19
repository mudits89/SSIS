using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Store_DisbursementLists : System.Web.UI.Page
{
    SSISEntities ent = new SSISEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

            //List<CollectionPoint> name = ent.CollectionPoints.ToList();
            //using (SSISEntities ctx=new SSISEntities())
            //{
            //    var qry = ctx.CollectionPoints.ToList()
            //        .Select(x => new { id = x.CollectionPoint_ID, cpAndTime = x.CollectionPoint_Name + " | " + x.CollectionPoint_Time });

            //    RadioButtonList1.DataSource = qry;
            //    RadioButtonList1.DataTextField = "cpAndTime";
            //    RadioButtonList1.DataValueField = "id";
            //    RadioButtonList1.DataBind();
            //}
            //foreach (var item in name)
            //{
            //    string pointName = item.CollectionPoint_Name.ToString();

        }
            //    string pointTime = item.CollectionPoint_Time.ToString();
            //   string toteTote= String.Format("{0:h:mm tt}", pointTime);


            //    RadioButtonList1.Items.Add(pointName+"|"+ toteTote);

            //}
           
        

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string depId = RadioButtonList1.SelectedValue;
            string depName = RadioButtonList1.SelectedItem.ToString();
            EntityDataSource5.Where= "it.[CollectionPoint_ID]=" + Int32.Parse(depId) +"";
            GridView1.DataSource = EntityDataSource5;
            GridView1.DataBind();

        }
    }