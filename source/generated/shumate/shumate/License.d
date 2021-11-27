module shumate.License;

private import glib.ConstructionException;
private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import gtk.AccessibleIF;
private import gtk.AccessibleT;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.ConstraintTargetIF;
private import gtk.ConstraintTargetT;
private import gtk.Widget;
private import shumate.Map;
private import shumate.c.functions;
public  import shumate.c.types;


/**
 * A widget that displays license text.
 */
public class License : Widget
{
	/** the main Gtk struct */
	protected ShumateLicense* shumateLicense;

	/** Get the main Gtk struct */
	public ShumateLicense* getLicenseStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return shumateLicense;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)shumateLicense;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (ShumateLicense* shumateLicense, bool ownedRef = false)
	{
		this.shumateLicense = shumateLicense;
		super(cast(GtkWidget*)shumateLicense, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return shumate_license_get_type();
	}

	/**
	 * Creates an instance of #ShumateLicense.
	 *
	 * Returns: a new #ShumateLicense.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = shumate_license_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(ShumateLicense*) __p);
	}

	/**
	 * Gets the additional license text.
	 *
	 * Returns: the additional license text
	 */
	public string getExtraText()
	{
		return Str.toString(shumate_license_get_extra_text(shumateLicense));
	}

	/**
	 * Gets the map that the license is showing information for.
	 *
	 * Returns: the map
	 */
	public Map getMap()
	{
		auto __p = shumate_license_get_map(shumateLicense);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Map)(cast(ShumateMap*) __p);
	}

	/**
	 * Get the license's text horizontal alignment.
	 *
	 * Returns: the license's text horizontal alignment.
	 */
	public float getXalign()
	{
		return shumate_license_get_xalign(shumateLicense);
	}

	/**
	 * Show the additional license text on the map view.  The text will preceed the
	 * map's licence when displayed. Use "\n" to separate the lines.
	 *
	 * Params:
	 *     text = the additional license text
	 */
	public void setExtraText(string text)
	{
		shumate_license_set_extra_text(shumateLicense, Str.toStringz(text));
	}

	/**
	 * Sets a map widget to show license information for. The license text will be
	 * collected from the map's layers, if they provide it.
	 *
	 * Params:
	 *     map = a [class@Map]
	 */
	public void setMap(Map map)
	{
		shumate_license_set_map(shumateLicense, (map is null) ? null : map.getMapStruct());
	}

	/**
	 * Set the license's text horizontal alignment.
	 *
	 * Params:
	 *     xalign = The license's text horizontal alignment
	 */
	public void setXalign(float xalign)
	{
		shumate_license_set_xalign(shumateLicense, xalign);
	}
}
