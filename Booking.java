package model;

public class Booking {
    private long bookingId;
    private int userId;
    private String receiverName;
    private String receiverPin;
    private String receiverMobile;
    private String receiverAddress;
    private float parcelWeight;
    private String parcelContent;
    private String parcelDelivery;
    private String parcelPacking;
    private String parcelPick;
    private String parcelDrop;
    private float parcelServiceCost;
    private String parcelPaymentType;
    private String parcelPaymentTime;
    private String parcelStatus;
    private String parcelLastUpdateTime;
	private String cardNumber;
    private String cardHolder;
    private String expiryDate;
    private String cvv;
    
    public String getCardNumber() {
		return cardNumber;
	}
	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}
	public String getCardHolder() {
		return cardHolder;
	}
	public void setCardHolder(String cardHolder) {
		this.cardHolder = cardHolder;
	}
	public String getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}
	public String getCvv() {
		return cvv;
	}
	public void setCvv(String cvv) {
		this.cvv = cvv;
	}
    public float getParcelServiceCost() {
        return parcelServiceCost;
    }
    public void setParcelServiceCost(float parcelServiceCost) {
        this.parcelServiceCost = parcelServiceCost;
    }
    public String getParcelPaymentTime() {
        return parcelPaymentTime;
    }
    public void setParcelPaymentTime(String parcelPaymentTime) {
        this.parcelPaymentTime = parcelPaymentTime;
    }
    public String getParcelStatus() {
        return parcelStatus;
    }
    public void setParcelStatus(String parcelStatus) {
        this.parcelStatus = parcelStatus;
    }    
    public String getReceiverAddress() {
        return receiverAddress;
    }
    public void setReceiverAddress(String receiverAddress) {
        this.receiverAddress = receiverAddress;
    }    
    public long getBookingId() {
        return bookingId;
    }
    public void setBookingId(long bookingId) {
        this.bookingId = bookingId;
    }
    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }
    public String getReceiverName() {
        return receiverName;
    }
    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }
    public String getReceiverPin() {
        return receiverPin;
    }
    public void setReceiverPin(String receiverPin) {
        this.receiverPin = receiverPin;
    }
    public String getReceiverMobile() {
        return receiverMobile;
    }
    public void setReceiverMobile(String receiverMobile) {
        this.receiverMobile = receiverMobile;
    }
    public float getParcelWeight() {
        return parcelWeight;
    }
    public void setParcelWeight(float parcelWeight) {
        this.parcelWeight = parcelWeight;
    }
    public String getParcelContent() {
        return parcelContent;
    }
    public void setParcelContent(String parcelContent) {
        this.parcelContent = parcelContent;
    }
    public String getParcelDelivery() {
        return parcelDelivery;
    }
    public void setParcelDelivery(String parcelDelivery) {
        this.parcelDelivery = parcelDelivery;
    }
    public String getParcelPacking() {
        return parcelPacking;
    }
    public void setParcelPacking(String parcelPacking) {
        this.parcelPacking = parcelPacking;
    }
    public String getParcelPick() {
        return parcelPick;
    }
    public void setParcelPick(String parcelPick) {
        this.parcelPick = parcelPick;
    }
    public String getParcelDrop() {
        return parcelDrop;
    }
    public void setParcelDrop(String parcelDrop) {
        this.parcelDrop = parcelDrop;
    }
    public String getParcelLastUpdateTime() {
        return parcelLastUpdateTime;
    }
    public void setParcelLastUpdateTime(String parcelLastUpdateTime) {
        this.parcelLastUpdateTime = parcelLastUpdateTime;
    }
    public String getParcelPaymentType() {
		return parcelPaymentType;
	}
	public void setParcelPaymentType(String parcelPaymentType) {
		this.parcelPaymentType = parcelPaymentType;
	}
    public Booking() {
    }
    public Booking(int userId, String receiverName, String receiverAddress, String receiverPin, String receiverMobile,
            float parcelWeight, String parcelContent, String parcelDelivery, String parcelPacking, 
            String parcelPick, String parcelDrop, float parcelServiceCost,String parcelPaymentType, String parcelStatus, String parcelPaymentTime) {
				this.userId = userId;
				this.receiverName = receiverName;
				this.receiverAddress = receiverAddress;
				this.receiverPin = receiverPin;
				this.receiverMobile = receiverMobile;
				this.parcelWeight = parcelWeight;
				this.parcelContent = parcelContent;
				this.parcelDelivery = parcelDelivery;
				this.parcelPacking = parcelPacking;
				this.parcelPick = parcelPick;
				this.parcelDrop = parcelDrop;
				this.parcelServiceCost = parcelServiceCost;
				this.parcelPaymentType = parcelPaymentType;
				this.parcelPaymentTime = parcelPaymentTime;
    }
}