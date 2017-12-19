using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for GridViewMerge
/// </summary>
public class GridViewMerge
{
    public static void MergeRows(GridView gridView)
    {
        for (int rowIndex = gridView.Rows.Count - 2; rowIndex >= 0; rowIndex--)
        {
            GridViewRow row = gridView.Rows[rowIndex];
            GridViewRow previousRow = gridView.Rows[rowIndex + 1];

            for (int i = 0; i < row.Cells.Count; i++)
            {
                if (row.Cells[1].Text == previousRow.Cells[1].Text)
                {
                    row.Cells[1].RowSpan = previousRow.Cells[1].RowSpan < 2 ? 2 :
                                           previousRow.Cells[1].RowSpan + 1;

                    previousRow.Cells[1].Visible = false;
                    previousRow.Attributes.Add("GridLines", "None");


                    row.Cells[6].RowSpan = previousRow.Cells[6].RowSpan < 2 ? 2 :
                                           previousRow.Cells[6].RowSpan + 1;
                    previousRow.Cells[6].Visible = false;


                    row.Cells[7].RowSpan = previousRow.Cells[7].RowSpan < 2 ? 2 :
                                           previousRow.Cells[7].RowSpan + 1;
                    previousRow.Cells[7].Visible = false;

                    row.Cells[9].RowSpan = previousRow.Cells[9].RowSpan < 2 ? 2 :
                                          previousRow.Cells[9].RowSpan + 1;
                    previousRow.Cells[9].Visible = false;

                    row.Cells[2].BorderColor = System.Drawing.Color.White;
                    row.Cells[3].BorderColor = System.Drawing.Color.White;
                    row.Cells[4].BorderColor = System.Drawing.Color.White;
                    row.Cells[5].BorderColor = System.Drawing.Color.White;
                }
            }
        }
    }
}