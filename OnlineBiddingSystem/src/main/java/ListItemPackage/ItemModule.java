package ListItemPackage;

import java.sql.Date;

public class ItemModule implements AuctionObject{
	private int id;
	private int seller_id;
	private String item_name;
	private double starting_bid;
	private Date closing_Date;
	private Date start_Date;  
	private String item_image_path;
	private String description;
	
	public ItemModule(int id, int seller_id, String item_name, double starting_bid, Date closing_Date_time,
			Date start_Date_time, String item_image_path, String description) {
		super();
		this.id = id;
		this.seller_id = seller_id;
		this.item_name = item_name;
		this.starting_bid = starting_bid;
		this.closing_Date= closing_Date_time;
		this.start_Date = start_Date_time;
		this.item_image_path = item_image_path;
		this.description = description;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getSeller_id() {
		return seller_id;
	}

	public void setSeller_id(int seller_id) {
		this.seller_id = seller_id;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public double getStarting_bid() {
		return starting_bid;
	}

	public void setStarting_bid(double starting_bid) {
		this.starting_bid = starting_bid;
	}

	public Date getClosing_Date() {
		return closing_Date;
	}

	public void setClosing_Date(Date closing_Date) {
		this.closing_Date = closing_Date;
	}

	public Date getStart_Date() {
		return start_Date;
	}

	public void setStart_Date(Date start_Date) {
		this.start_Date = start_Date;
	}

	public String getItem_image_path() {
		return item_image_path;
	}

	public void setItem_image_path(String item_image_path) {
		this.item_image_path = item_image_path;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}


	
	
	
	  
}
