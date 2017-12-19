using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

    public partial class Add_New_supplier : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btn_cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/com.ssis.PurchaseDepartmentRepresentative/MaintainSupplierInformation.aspx");
        }

        protected void btn_add_new_suppl_Click(object sender, EventArgs e)
        {
            String Name = tbx_name.Text;
            String iD = tbx_id.Text;
            String Address = tbx_address.Text;
            int num = Convert.ToInt32(tbx_contactno.Text);
            String Cname = tbx_cntctname.Text; 
            int fno = Convert.ToInt32(tbx_fax.Text);
             String GST = tbx_gst.Text;
             String Remark = tbx_remark.Text;
            try
            {

                using (SSISEntities entity = new SSISEntities())
                {
                    Supplier sup = new Supplier
                    {
                        Supplier_ID = iD,
                        Supplier_Name = Name,
                        Address = Address,
                        Contact_Number = num,
                        Contact_Name = Cname,
                        Fax_Number = fno,
                        GST_Number = GST,
                        Remarks = Remark
                    };
                    entity.Suppliers.Add(sup);
                    entity.SaveChanges();

                    foreach (ListItem item in ListBox1.Items)
                    {
                        if (item.Selected)
                        {
                            string ItemNumber = item.Value;
                            Supplier_Item si = new Supplier_Item
                            {
                                Supplier_ID = iD,
                                Item_Number = ItemNumber
                            };
                            entity.Supplier_Item.Add(si);
                            entity.SaveChanges();
                        }

                    }
                }
            }
            catch
            {
                lblexcep.Text = "Supplier ID already Exist.Please try with different Id.";
                lblexcep.BackColor = System.Drawing.Color.Red;
                lblexcep.ForeColor = System.Drawing.Color.White;
                lblexcep.Visible = true;
            }

            
            Response.Redirect("~/com.ssis.PurchaseDepartmentRepresentative/MaintainSupplierInformation.aspx");
        }


    }
