module gdk.FocusEvent;

private import gdk.Event;
private import gdk.c.functions;
public  import gdk.c.types;


/**
 * An event related to a keyboard focus change.
 */
public class FocusEvent : Event
{
	/** the main Gtk struct */
	protected GdkFocusEvent* gdkFocusEvent;

	/** Get the main Gtk struct */
	public GdkFocusEvent* getFocusEventStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gdkFocusEvent;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gdkFocusEvent;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GdkFocusEvent* gdkFocusEvent, bool ownedRef = false)
	{
		this.gdkFocusEvent = gdkFocusEvent;
		super(cast(GdkEvent*)gdkFocusEvent, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gdk_focus_event_get_type();
	}

	/**
	 * Extracts whether this event is about focus entering or
	 * leaving the surface.
	 *
	 * Returns: %TRUE of the focus is entering
	 */
	public bool getIn()
	{
		return gdk_focus_event_get_in(cast(GdkEvent*)gdkFocusEvent) != 0;
	}
}
