namespace WebProjectV1.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class addednewcustomercolumns : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.AspNetUsers", "FirstName", c => c.String());
            AddColumn("dbo.AspNetUsers", "Surname", c => c.String());
            AddColumn("dbo.AspNetUsers", "DOB", c => c.DateTime(nullable: false));
            AddColumn("dbo.AspNetUsers", "AddressLine1", c => c.String());
            AddColumn("dbo.AspNetUsers", "AddressLine2", c => c.String());
            AddColumn("dbo.AspNetUsers", "AddressLine3", c => c.String());
            AddColumn("dbo.AspNetUsers", "City", c => c.String());
            AddColumn("dbo.AspNetUsers", "County", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.AspNetUsers", "County");
            DropColumn("dbo.AspNetUsers", "City");
            DropColumn("dbo.AspNetUsers", "AddressLine3");
            DropColumn("dbo.AspNetUsers", "AddressLine2");
            DropColumn("dbo.AspNetUsers", "AddressLine1");
            DropColumn("dbo.AspNetUsers", "DOB");
            DropColumn("dbo.AspNetUsers", "Surname");
            DropColumn("dbo.AspNetUsers", "FirstName");
        }
    }
}
