module shumate.Coordinate;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import shumate.LocationIF;
private import shumate.LocationT;
private import shumate.c.functions;
public  import shumate.c.types;


/**
 * A simple object implementing [iface@Location].
 */
public class Coordinate : ObjectG, LocationIF
{
	/** the main Gtk struct */
	protected ShumateCoordinate* shumateCoordinate;

	/** Get the main Gtk struct */
	public ShumateCoordinate* getCoordinateStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return shumateCoordinate;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)shumateCoordinate;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (ShumateCoordinate* shumateCoordinate, bool ownedRef = false)
	{
		this.shumateCoordinate = shumateCoordinate;
		super(cast(GObject*)shumateCoordinate, ownedRef);
	}

	// add the Location capabilities
	mixin LocationT!(ShumateCoordinate);


	/** */
	public static GType getType()
	{
		return shumate_coordinate_get_type();
	}

	/**
	 * Creates a new instance of #ShumateCoordinate.
	 *
	 * Returns: the created instance.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = shumate_coordinate_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(ShumateCoordinate*) __p);
	}

	/**
	 * Creates a new instance of #ShumateCoordinate initialized with the given
	 * coordinates.
	 *
	 * Params:
	 *     latitude = the latitude coordinate
	 *     longitude = the longitude coordinate
	 *
	 * Returns: the created instance.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(double latitude, double longitude)
	{
		auto __p = shumate_coordinate_new_full(latitude, longitude);

		if(__p is null)
		{
			throw new ConstructionException("null returned by new_full");
		}

		this(cast(ShumateCoordinate*) __p);
	}
}
