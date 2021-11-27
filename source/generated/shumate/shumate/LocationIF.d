module shumate.LocationIF;

private import shumate.c.functions;
public  import shumate.c.types;


/**
 * An interface common to objects having latitude and longitude
 * 
 * By implementing #ShumateLocation the object declares that it has latitude
 * and longitude and can be used to specify location on the map.
 */
public interface LocationIF{
	/** Get the main Gtk struct */
	public ShumateLocation* getLocationStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return shumate_location_get_type();
	}

	/**
	 * Gets the latitude coordinate in degrees.
	 *
	 * Returns: the latitude coordinate in degrees.
	 */
	public double getLatitude();

	/**
	 * Gets the longitude coordinate in degrees.
	 *
	 * Returns: the longitude coordinate in degrees.
	 */
	public double getLongitude();

	/**
	 * Sets the coordinates of the location
	 *
	 * Params:
	 *     latitude = the latitude in degrees
	 *     longitude = the longitude in degrees
	 */
	public void setLocation(double latitude, double longitude);
}
