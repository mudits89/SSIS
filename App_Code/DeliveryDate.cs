using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DeliveryDate
/// </summary>
public class DeliveryDate
{
    
        public static string getDeliveryDate()
    {
        string deliveryDate = null;
        if (DateTime.Today.DayOfWeek.ToString() == "Monday")
        {
            deliveryDate = DateTime.Today.Date.ToString("dd - MMM - yyyy");

        }
        else if (DateTime.Today.DayOfWeek.ToString() == "Tuesday")
        {
            deliveryDate = DateTime.Today.AddDays(6).Date.ToString("dd - MMM - yyyy");
        }
        else if (DateTime.Today.DayOfWeek.ToString() == "Wednesday")
        {
            deliveryDate = DateTime.Today.AddDays(5).Date.ToString("dd - MMM - yyyy");
        }
        else if (DateTime.Today.DayOfWeek.ToString() == "Thursday")
        {
            deliveryDate = DateTime.Today.AddDays(4).Date.ToString("dd - MMM - yyyy");
        }
        else if (DateTime.Today.DayOfWeek.ToString() == "Friday")
        {
            deliveryDate = DateTime.Today.AddDays(3).Date.ToString("dd - MMM - yyyy");
        }
        else if (DateTime.Today.DayOfWeek.ToString() == "Saturaday")
        {
            deliveryDate = DateTime.Today.AddDays(2).Date.ToString("dd - MMM - yyyy");
        }
        else if (DateTime.Today.DayOfWeek.ToString() == "Sunday")
        {
            deliveryDate = DateTime.Today.AddDays(1).Date.ToString("dd - MMM - yyyy");
        }

        return deliveryDate;
    }
}
