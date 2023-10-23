package com.lounge.pet.support.domain;

import java.sql.Date;

public class SupportTotalAmount {
	private Date paydate;
	private String sHPaytype;
	private int totalAmount;
	
	
	public Date getPaydate() {
		return paydate;
	}

	public void setPaydate(Date paydate) {
		this.paydate = paydate;
	}
	
	public String getsHPaytype() {
		return sHPaytype;
	}

	public void setsHPaytype(String sHPaytype) {
		this.sHPaytype = sHPaytype;
	}

	public int getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}

	@Override
	public String toString() {
		return "SupportTotalAmount [paydate=" + paydate + ", sHPaytype=" + sHPaytype + ", totalAmount=" + totalAmount
				+ "]";
	}
}
