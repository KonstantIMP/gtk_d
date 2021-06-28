module shumate.View;

private import glib.ConstructionException;
private import glib.ListG;
private import gobject.ObjectG;
private import gobject.Signals;
private import gtk.AccessibleIF;
private import gtk.AccessibleT;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.ConstraintTargetIF;
private import gtk.ConstraintTargetT;
private import gtk.Widget;
private import shumate.Layer;
private import shumate.MapSource;
private import shumate.Viewport;
private import shumate.c.functions;
public  import shumate.c.types;
private import std.algorithm;


/**
 * The #ShumateView structure contains only private data
 * and should be accessed using the provided API
 */
public class View : Widget
{
	/** the main Gtk struct */
	protected ShumateView* shumateView;

	/** Get the main Gtk struct */
	public ShumateView* getViewStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return shumateView;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)shumateView;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (ShumateView* shumateView, bool ownedRef = false)
	{
		this.shumateView = shumateView;
		super(cast(GtkWidget*)shumateView, ownedRef);
	}

	/**
	 * Creates an instance of #ShumateView.
	 *
	 * Returns: a new #ShumateView ready to be used as a #GtkWidget.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(bool simple = false)
	{
		ShumateView* __p;

		if (simple) __p = shumate_view_new_simple();
		else __p = shumate_view_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(ShumateView*) __p);
	}

	/**
	 */

	/** */
	public static GType getType()
	{
		return shumate_view_get_type();
	}

	/**
	 * Adds a new layer to the view
	 *
	 * Params:
	 *     layer = a #ShumateLayer
	 */
	public void addLayer(Layer layer)
	{
		shumate_view_add_layer(shumateView, (layer is null) ? null : layer.getLayerStruct());
	}

	/**
	 * Adds a new overlay map source to render tiles on top of the ordinary map
	 * source. Multiple overlay sources can be added.
	 *
	 * Params:
	 *     mapSource = a #ShumateMapSource
	 */
	public void addOverlaySource(MapSource mapSource)
	{
		shumate_view_add_overlay_source(shumateView, (mapSource is null) ? null : mapSource.getMapSourceStruct());
	}

	/**
	 * Centers the map on these coordinates.
	 *
	 * Params:
	 *     latitude = the longitude to center the map at
	 *     longitude = the longitude to center the map at
	 */
	public void centerOn(double latitude, double longitude)
	{
		shumate_view_center_on(shumateView, latitude, longitude);
	}

	/**
	 * Checks whether the view animates zoom level changes.
	 *
	 * Returns: TRUE if the view animates zooms, FALSE otherwise.
	 */
	public bool getAnimateZoom()
	{
		return shumate_view_get_animate_zoom(shumateView) != 0;
	}

	/**
	 * Get the 'go-to-duration' property.
	 *
	 * Returns: the animation duration when calling shumate_view_go_to(),
	 *     in milliseconds.
	 */
	public uint getGoToDuration()
	{
		return shumate_view_get_go_to_duration(shumateView);
	}

	/**
	 * Gets a list of overlay sources.
	 *
	 * Returns: the list
	 */
	public ListG getOverlaySources()
	{
		auto __p = shumate_view_get_overlay_sources(shumateView);

		if(__p is null)
		{
			return null;
		}

		return new ListG(cast(GList*) __p);
	}

	/**
	 * Gets the view's state.
	 *
	 * Returns: the state.
	 */
	public ShumateState getState()
	{
		return shumate_view_get_state(shumateView);
	}

	/**
	 * Get the #ShumateViewport used by this view.
	 *
	 * Returns: the #ShumateViewport
	 */
	public Viewport getViewport()
	{
		auto __p = shumate_view_get_viewport(shumateView);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Viewport)(cast(ShumateViewport*) __p);
	}

	/**
	 * Checks whether the view zooms on double click.
	 *
	 * Returns: TRUE if the view zooms on double click, FALSE otherwise.
	 */
	public bool getZoomOnDoubleClick()
	{
		return shumate_view_get_zoom_on_double_click(shumateView) != 0;
	}

	/**
	 * Move from the current position to these coordinates. All tiles in the
	 * intermediate view WILL be loaded!
	 *
	 * Params:
	 *     latitude = the longitude to center the map at
	 *     longitude = the longitude to center the map at
	 */
	public void goTo(double latitude, double longitude)
	{
		shumate_view_go_to(shumateView, latitude, longitude);
	}

	/**
	 * Adds @layer to @view above @next_sibling or, if @next_sibling is %NULL, at
	 * the bottom of the layer list.
	 *
	 * Params:
	 *     layer = a #ShumateLayer
	 *     nextSibling = a #ShumateLayer that is a child of @view, or %NULL
	 */
	public void insertLayerAbove(Layer layer, Layer nextSibling)
	{
		shumate_view_insert_layer_above(shumateView, (layer is null) ? null : layer.getLayerStruct(), (nextSibling is null) ? null : nextSibling.getLayerStruct());
	}

	/**
	 * Adds @layer to @view behind @next_sibling or, if @next_sibling is %NULL, at
	 * the top of the layer list.
	 *
	 * Params:
	 *     layer = a #ShumateLayer
	 *     nextSibling = a #ShumateLayer that is a child of @view, or %NULL
	 */
	public void insertLayerBehind(Layer layer, Layer nextSibling)
	{
		shumate_view_insert_layer_behind(shumateView, (layer is null) ? null : layer.getLayerStruct(), (nextSibling is null) ? null : nextSibling.getLayerStruct());
	}

	/**
	 * Removes the given layer from the view
	 *
	 * Params:
	 *     layer = a #ShumateLayer
	 */
	public void removeLayer(Layer layer)
	{
		shumate_view_remove_layer(shumateView, (layer is null) ? null : layer.getLayerStruct());
	}

	/**
	 * Removes an overlay source from #ShumateView.
	 *
	 * Params:
	 *     mapSource = a #ShumateMapSource
	 */
	public void removeOverlaySource(MapSource mapSource)
	{
		shumate_view_remove_overlay_source(shumateView, (mapSource is null) ? null : mapSource.getMapSourceStruct());
	}

	/**
	 * Should the view animate zoom level changes.
	 *
	 * Params:
	 *     value = a #gboolean
	 */
	public void setAnimateZoom(bool value)
	{
		shumate_view_set_animate_zoom(shumateView, value);
	}

	/**
	 * Set the duration of the transition of shumate_view_go_to().
	 *
	 * Params:
	 *     duration = the animation duration, in milliseconds
	 */
	public void setGoToDuration(uint duration)
	{
		shumate_view_set_go_to_duration(shumateView, duration);
	}

	/**
	 * Changes the currently used map source. #g_object_unref() will be called on
	 * the previous one.
	 *
	 * As a side effect, changing the primary map source will also clear all
	 * secondary map sources.
	 *
	 * Params:
	 *     mapSource = a #ShumateMapSource
	 */
	public void setMapSource(MapSource mapSource)
	{
		shumate_view_set_map_source(shumateView, (mapSource is null) ? null : mapSource.getMapSourceStruct());
	}

	/**
	 * Should the view zoom in and recenter when the user double click on the map.
	 *
	 * Params:
	 *     value = a #gboolean
	 */
	public void setZoomOnDoubleClick(bool value)
	{
		shumate_view_set_zoom_on_double_click(shumateView, value);
	}

	/**
	 * Stop the go to animation.  The view will stay where it was when the
	 * animation was stopped.
	 */
	public void stopGoTo()
	{
		shumate_view_stop_go_to(shumateView);
	}

	/**
	 * The #ShumateView::animation-completed signal is emitted when any animation in the view
	 * ends.  This is a detailed signal.  For example, if you want to be signaled
	 * only for go-to animation, you should connect to
	 * "animation-completed::go-to". And for zoom, connect to "animation-completed::zoom".
	 */
	gulong addOnAnimationCompleted(void delegate(View) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "animation-completed", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
