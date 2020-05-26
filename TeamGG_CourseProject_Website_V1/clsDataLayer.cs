// Using system import
using System.Data.OleDb;
using System.Net;
using System.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TeamGG_CourseProject_Website_V1;

/// <summary>
/// Summary description for clsDataLayer
/// Robert Kieca, CIS407A
/// </summary>
public class clsDataLayer
{

    // This function verifies a user in the tblUser table
    public static dsPerson VerifyUser(string Database, string UserName, string UserPassword)
    {
            // Add your comments here
            dsPerson DP;
            OleDbConnection sqlConn;
            OleDbDataAdapter sqlDA;
            // Add your comments here
            sqlConn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + Database);
            // Add your comments here
            sqlDA = new OleDbDataAdapter("SELECT User_Id, Role from PERSON where UserName like '" + UserName + "' " +
             "and UserPassword like '" + UserPassword + "'", sqlConn);
            // Add your comments here
            DP = new dsPerson();
            // Add your comments here
            sqlDA.Fill(DP.PERSON);
            // Add your comments here
            return DP;
        }

    // This function verifies a user in the tblUser table
    public static dsPerson getUserInfo(string Database, string userid)
    {
        // Add your comments here
        dsPerson DP;
        OleDbConnection sqlConn;
        OleDbDataAdapter sqlDA;
        // Add your comments here
        sqlConn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + Database);
        // Add your comments here
        sqlDA = new OleDbDataAdapter("SELECT Fname, LName from PERSON where User_Id = " + userid + " ", sqlConn);
        // Add your comments here
        DP = new dsPerson();
        // Add your comments here
        sqlDA.Fill(DP.PERSON);
        // Add your comments here
        return DP;
    }
}