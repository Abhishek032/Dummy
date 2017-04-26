package DemoServs;

import java.sql.Date;

public class TableData {
		private String ponumber;
		private String supplier;
		private Date duedate;
		private String postatus;
		private String priority;
		private String items;
		private String shipfrom;
		private String shipto;
		private String trans;
		
		
		public String getPonumber() {
			return ponumber;
		}

		public void setPonumber(String ponumber) {
			this.ponumber = ponumber;
		}

		public String getSupplier() {
			return supplier;
		}

		public void setSupplier(String supplier) {
			this.supplier = supplier;
		}

		public Date getDuedate() {
			return duedate;
		}

		public void setDuedate(Date date) {
			this.duedate = date;
		}

		public String getPostatus() {
			return postatus;
		}

		public void setPostatus(String postatus) {
			this.postatus = postatus;
		}

		public String getPriority() {
			return priority;
		}

		public void setPriority(String priority) {
			this.priority = priority;
		}

		public String getItems() {
			return items;
		}

		public void setItems(String items) {
			this.items = items;
		}

		public String getShipfrom() {
			return shipfrom;
		}

		public void setShipfrom(String shipfrom) {
			this.shipfrom = shipfrom;
		}

		public String getShipto() {
			return shipto;
		}

		public void setShipto(String shipto) {
			this.shipto = shipto;
		}

		public String getTrans() {
			return trans;
		}

		public void setTrans(String trans) {
			this.trans = trans;
		}

}
