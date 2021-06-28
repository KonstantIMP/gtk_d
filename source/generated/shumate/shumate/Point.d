module shumate.Point;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import shumate.Marker;
private import shumate.c.functions;
public  import shumate.c.types;


/**
 * The #ShumatePoint structure contains only private data
 * and should be accessed using the provided API
 */
public class Point : Marker
{
	/** the main Gtk struct */
	protected ShumatePoint* shumatePoint;

	/** Get the main Gtk struct */
	public ShumatePoint* getPointStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return shumatePoint;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)shumatePoint;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (ShumatePoint* shumatePoint, bool ownedRef = false)
	{
		this.shumatePoint = shumatePoint;
		super(cast(ShumateMarker*)shumatePoint, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return shumate_point_get_type();
	}

	/**
	 * Creates an instance of #ShumatePoint.
	 *
	 * Returns: a new #ShumatePoint.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = shumate_point_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(ShumatePoint*) __p);
	}
}
