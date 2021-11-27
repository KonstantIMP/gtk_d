module shumate.LocationT;

public  import shumate.c.functions;
public  import shumate.c.types;


/**
 * An interface common to objects having latitude and longitude
 * 
 * By implementing #ShumateLocation the object declares that it has latitude
 * and longitude and can be used to specify location on the map.
 */
public template LocationT(TStruct)
{
	/** Get the main Gtk struct */
	public ShumateLocation* getLocationStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return cast(ShumateLocation*)getStruct();
	}


	/**
	 * Gets the latitude coordinate in degrees.
	 *
	 * Returns: the latitude coordinate in degrees.
	 */
	public double getLatitude()
	{
		return shumate_location_get_latitude(getLocationStruct());
	}

	/**
	 * Gets the longitude coordinate in degrees.
	 *
	 * Returns: the longitude coordinate in degrees.
	 */
	public double getLongitude()
	{
		return shumate_location_get_longitude(getLocationStruct());
	}

	/**
	 * Sets the coordinates of the location
	 *
	 * Params:
	 *     latitude = the latitude in degrees
	 *     longitude = the longitude in degrees
	 */
	public void setLocation(double latitude, double longitude)
	{
		shumate_location_set_location(getLocationStruct(), latitude, longitude);
	}
}
