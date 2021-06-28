module shumate.Marker;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.AccessibleIF;
private import gtk.AccessibleT;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.ConstraintTargetIF;
private import gtk.ConstraintTargetT;
private import gtk.Widget;
private import shumate.LocationIF;
private import shumate.LocationT;
private import shumate.c.functions;
public  import shumate.c.types;


/**
 * The #ShumateMarker structure contains only private data
 * and should be accessed using the provided API
 */
public class Marker : Widget, LocationIF
{
	/** the main Gtk struct */
	protected ShumateMarker* shumateMarker;

	/** Get the main Gtk struct */
	public ShumateMarker* getMarkerStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return shumateMarker;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)shumateMarker;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (ShumateMarker* shumateMarker, bool ownedRef = false)
	{
		this.shumateMarker = shumateMarker;
		super(cast(GtkWidget*)shumateMarker, ownedRef);
	}

	// add the Location capabilities
	mixin LocationT!(ShumateMarker);


	/** */
	public static GType getType()
	{
		return shumate_marker_get_type();
	}

	/**
	 * Creates an instance of #ShumateMarker.
	 *
	 * Returns: a new #ShumateMarker.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = shumate_marker_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(ShumateMarker*) __p);
	}

	/** */
	public void animateIn()
	{
		shumate_marker_animate_in(shumateMarker);
	}

	/** */
	public void animateInWithDelay(uint delay)
	{
		shumate_marker_animate_in_with_delay(shumateMarker, delay);
	}

	/** */
	public void animateOut()
	{
		shumate_marker_animate_out(shumateMarker);
	}

	/** */
	public void animateOutWithDelay(uint delay)
	{
		shumate_marker_animate_out_with_delay(shumateMarker, delay);
	}

	/**
	 * Retrieves the current child of @marker.
	 *
	 * Returns: a #GtkWidget.
	 */
	public Widget getChild()
	{
		auto __p = shumate_marker_get_child(shumateMarker);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Widget)(cast(GtkWidget*) __p);
	}

	/**
	 * Checks whether the marker is draggable.
	 *
	 * Returns: the draggable or not state of the marker.
	 */
	public bool getDraggable()
	{
		return shumate_marker_get_draggable(shumateMarker) != 0;
	}

	/**
	 * Checks whether the marker is selectable.
	 *
	 * Returns: the selectable or not state of the marker.
	 */
	public bool getSelectable()
	{
		return shumate_marker_get_selectable(shumateMarker) != 0;
	}

	/**
	 * Checks whether the marker is selected.
	 *
	 * Returns: %TRUE if the marker is selected, otherwise %FALSE
	 */
	public bool isSelected()
	{
		return shumate_marker_is_selected(shumateMarker) != 0;
	}

	/**
	 * Sets the child widget of @marker.
	 *
	 * Params:
	 *     child = a #GtkWidget
	 */
	public void setChild(Widget child)
	{
		shumate_marker_set_child(shumateMarker, (child is null) ? null : child.getWidgetStruct());
	}

	/**
	 * Sets the marker as draggable or not.
	 *
	 * Params:
	 *     value = the draggable state
	 */
	public void setDraggable(bool value)
	{
		shumate_marker_set_draggable(shumateMarker, value);
	}

	/**
	 * Sets the marker as selectable or not.
	 *
	 * Params:
	 *     value = the selectable state
	 */
	public void setSelectable(bool value)
	{
		shumate_marker_set_selectable(shumateMarker, value);
	}
}
