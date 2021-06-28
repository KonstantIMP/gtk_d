module gdk.TouchEvent;

private import gdk.Event;
private import gdk.c.functions;
public  import gdk.c.types;


/**
 * An event related to a touch-based device.
 */
public class TouchEvent : Event
{
	/** the main Gtk struct */
	protected GdkTouchEvent* gdkTouchEvent;

	/** Get the main Gtk struct */
	public GdkTouchEvent* getTouchEventStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gdkTouchEvent;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gdkTouchEvent;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GdkTouchEvent* gdkTouchEvent, bool ownedRef = false)
	{
		this.gdkTouchEvent = gdkTouchEvent;
		super(cast(GdkEvent*)gdkTouchEvent, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gdk_touch_event_get_type();
	}

	/**
	 * Extracts whether a touch event is emulating a pointer event.
	 *
	 * Returns: %TRUE if @event is emulating
	 */
	public bool getEmulatingPointer()
	{
		return gdk_touch_event_get_emulating_pointer(cast(GdkEvent*)gdkTouchEvent) != 0;
	}
}
