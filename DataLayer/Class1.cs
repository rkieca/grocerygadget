using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.OleDb;
using System.IO;

namespace DataLayer
{
    public class DataConnector
    {
        protected OleDbDataAdapter DataAdapter1 = new OleDbDataAdapter();
       /*declaring try-catch*/
        public string ErrorMessage = "";
        public DataConnector(string ConnectionString)
        {
/*connection to the database by creating this object*/
            OleDbConnection Connection1 = new OleDbConnection(ConnectionString);
            this.DataAdapter1.SelectCommand = new OleDbCommand("", Connection1);
            this.DataAdapter1.InsertCommand = new OleDbCommand("", Connection1);
        }

        /*ability to select info from the database and put it in the datatable*/
        public DataTable DataSelect(string query)
        {
            
            DataTable dt = new DataTable();

            /*try-catch for errors*/
            try
            {
               /*set the query to the database*/
                DataAdapter1.SelectCommand.CommandText = query;
                /*open connection to the database*/
                DataAdapter1.SelectCommand.Connection.Open();
                /*fill up to datatable with the query*/
                DataAdapter1.Fill(dt);
                /*close down the connection to database*/
                DataAdapter1.SelectCommand.Connection.Close();
                /*setting error message here to blank since it was successful if it passed this far*/
                ErrorMessage = "";
            }
            catch(Exception err)

            {
                /*allows you to know there is an error and check the error message string*/
                ErrorMessage = err.Message;
                DataAdapter1.SelectCommand.Connection.Close();
            }

            /*return the datatable as an object*/
            return dt;
        }
        
        public int DataInsert(string query)
        {

            /*send back how many rows have been affected*/
            int Result = 0;

            /*try-catch for errors*/
            try
            {
                /*set the query to the database*/
                DataAdapter1.InsertCommand.CommandText = query;
                /*open connection to the database*/
                DataAdapter1.InsertCommand.Connection.Open();
                /*executes the query that isn't expected to return any results*/
                Result = DataAdapter1.InsertCommand.ExecuteNonQuery();
                /*close down the connection to database*/
                DataAdapter1.InsertCommand.Connection.Close();
                /*setting error message here to blank since it was successful if it passed this far*/
                ErrorMessage = "";
                /*return the datatable as an object*/
                return Result;
            }
            catch (Exception err)
            {
                /*allows you to know there is an error and check the error message string*/
                ErrorMessage = err.Message;
                DataAdapter1.InsertCommand.Connection.Close();
                return 0;
            }
         }
        /*it will call the piece of code thats called datainsert and run that instead*/
        public int DataUpdate(string query)
        {
            return DataInsert(query);
        }
        public int DataDelete(string query)
        {
            return DataInsert(query);
        }
    }
}
