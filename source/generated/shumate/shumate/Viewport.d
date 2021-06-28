module shumate.Viewport;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.Widget;
private import shumate.LocationIF;
private import shumate.LocationT;
private import shumate.MapSource;
private import shumate.c.functions;
public  import shumate.c.types;


/** */
public class Viewport : ObjectG, LocationIF
{
	/** the main Gtk struct */
	protected ShumateViewport* shumateViewport;

	/** Get the main Gtk struct */
	public ShumateViewport* getViewportStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return shumateViewport;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)shumateViewport;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (ShumateViewport* shumateViewport, bool ownedRef = false)
	{
		this.shumateViewport = shumateViewport;
		super(cast(GObject*)shumateViewport, ownedRef);
	}

	// add the Location capabilities
	mixin LocationT!(ShumateViewport);


	/** */
	public static GType getType()
	{
		return shumate_viewport_get_type();
	}

	/**
	 * Creates a new #ShumateViewport
	 *
	 * Returns: A new #ShumateViewport
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = shumate_viewport_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(ShumateViewport*) __p, true);
	}

	/**
	 * Get the maximal zoom level
	 *
	 * Returns: the maximal zoom level
	 */
	public uint getMaxZoomLevel()
	{
		return shumate_viewport_get_max_zoom_level(shumateViewport);
	}

	/**
	 * Get the minimal zoom level
	 *
	 * Returns: the minimal zoom level
	 */
	public uint getMinZoomLevel()
	{
		return shumate_viewport_get_min_zoom_level(shumateViewport);
	}

	/**
	 * Get the reference map source
	 *
	 * Returns: the reference #ShumateMapSource or %NULL
	 *     when none has been set.
	 */
	public MapSource getReferenceMapSource()
	{
		auto __p = shumate_viewport_get_reference_map_source(shumateViewport);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(MapSource)(cast(ShumateMapSource*) __p);
	}

	/**
	 * Get the current zoom level
	 *
	 * Returns: the current zoom level
	 */
	public double getZoomLevel()
	{
		return shumate_viewport_get_zoom_level(shumateViewport);
	}

	/**
	 * Get an y coordinate of a widget from the latitude.
	 * The widget is assumed to be using the viewport.
	 *
	 * Params:
	 *     widget = a #GtkWidget that uses @self as viewport
	 *     latitude = the latitude
	 *
	 * Returns: the y coordinate
	 */
	public double latitudeToWidgetY(Widget widget, double latitude)
	{
		return shumate_viewport_latitude_to_widget_y(shumateViewport, (widget is null) ? null : widget.getWidgetStruct(), latitude);
	}

	/**
	 * Get an x coordinate of a widget from the longitude.
	 * The widget is assumed to be using the viewport.
	 *
	 * Params:
	 *     widget = a #GtkWidget that uses @self as viewport
	 *     longitude = the longitude
	 *
	 * Returns: the x coordinate
	 */
	public double longitudeToWidgetX(Widget widget, double longitude)
	{
		return shumate_viewport_longitude_to_widget_x(shumateViewport, (widget is null) ? null : widget.getWidgetStruct(), longitude);
	}

	/**
	 * Set the maximal zoom level
	 *
	 * Params:
	 *     maxZoomLevel = the maximal zoom level
	 */
	public void setMaxZoomLevel(uint maxZoomLevel)
	{
		shumate_viewport_set_max_zoom_level(shumateViewport, maxZoomLevel);
	}

	/**
	 * Set the minimal zoom level
	 *
	 * Params:
	 *     minZoomLevel = the minimal zoom level
	 */
	public void setMinZoomLevel(uint minZoomLevel)
	{
		shumate_viewport_set_min_zoom_level(shumateViewport, minZoomLevel);
	}

	/**
	 * Set the reference map source
	 *
	 * Params:
	 *     mapSource = a #ShumateMapSource or %NULL to set none.
	 */
	public void setReferenceMapSource(MapSource mapSource)
	{
		shumate_viewport_set_reference_map_source(shumateViewport, (mapSource is null) ? null : mapSource.getMapSourceStruct());
	}

	/**
	 * Set the zoom level
	 *
	 * Params:
	 *     zoomLevel = the zoom level
	 */
	public void setZoomLevel(double zoomLevel)
	{
		shumate_viewport_set_zoom_level(shumateViewport, zoomLevel);
	}

	/**
	 * Get the longitude from an x coordinate of a widget.
	 * The widget is assumed to be using the viewport.
	 *
	 * Params:
	 *     widget = a #GtkWidget that uses @self as viewport
	 *     x = the x coordinate
	 *
	 * Returns: the longitude
	 */
	public double widgetXToLongitude(Widget widget, double x)
	{
		return shumate_viewport_widget_x_to_longitude(shumateViewport, (widget is null) ? null : widget.getWidgetStruct(), x);
	}

	/**
	 * Get the latitude from an y coordinate of a widget.
	 * The widget is assumed to be using the viewport.
	 *
	 * Params:
	 *     widget = a #GtkWidget that uses @self as viewport
	 *     y = the y coordinate
	 *
	 * Returns: the latitude
	 */
	public double widgetYToLatitude(Widget widget, double y)
	{
		return shumate_viewport_widget_y_to_latitude(shumateViewport, (widget is null) ? null : widget.getWidgetStruct(), y);
	}

	/**
	 * Increases the zoom level
	 */
	public void zoomIn()
	{
		shumate_viewport_zoom_in(shumateViewport);
	}

	/**
	 * Decreases the zoom level
	 */
	public void zoomOut()
	{
		shumate_viewport_zoom_out(shumateViewport);
	}
}
