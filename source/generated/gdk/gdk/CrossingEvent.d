module gdk.CrossingEvent;

private import gdk.Event;
private import gdk.c.functions;
public  import gdk.c.types;


/**
 * An event caused by a pointing device moving between surfaces.
 */
public class CrossingEvent : Event
{
	/** the main Gtk struct */
	protected GdkCrossingEvent* gdkCrossingEvent;

	/** Get the main Gtk struct */
	public GdkCrossingEvent* getCrossingEventStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gdkCrossingEvent;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gdkCrossingEvent;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GdkCrossingEvent* gdkCrossingEvent, bool ownedRef = false)
	{
		this.gdkCrossingEvent = gdkCrossingEvent;
		super(cast(GdkEvent*)gdkCrossingEvent, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gdk_crossing_event_get_type();
	}

	/**
	 * Extracts the notify detail from a crossing event.
	 *
	 * Returns: the notify detail of @event
	 */
	public GdkNotifyType getDetail()
	{
		return gdk_crossing_event_get_detail(cast(GdkEvent*)gdkCrossingEvent);
	}

	/**
	 * Checks if the @event surface is the focus surface.
	 *
	 * Returns: %TRUE if the surface is the focus surface
	 */
	public bool getFocus()
	{
		return gdk_crossing_event_get_focus(cast(GdkEvent*)gdkCrossingEvent) != 0;
	}

	/**
	 * Extracts the crossing mode from a crossing event.
	 *
	 * Returns: the mode of @event
	 */
	public GdkCrossingMode getMode()
	{
		return gdk_crossing_event_get_mode(cast(GdkEvent*)gdkCrossingEvent);
	}
}
