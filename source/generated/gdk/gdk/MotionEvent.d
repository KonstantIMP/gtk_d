module gdk.MotionEvent;

private import gdk.Event;
private import gdk.c.functions;
public  import gdk.c.types;


/**
 * An event related to a pointer or touch device motion.
 */
public class MotionEvent : Event
{
	/** the main Gtk struct */
	protected GdkMotionEvent* gdkMotionEvent;

	/** Get the main Gtk struct */
	public GdkMotionEvent* getMotionEventStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gdkMotionEvent;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gdkMotionEvent;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GdkMotionEvent* gdkMotionEvent, bool ownedRef = false)
	{
		this.gdkMotionEvent = gdkMotionEvent;
		super(cast(GdkEvent*)gdkMotionEvent, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gdk_motion_event_get_type();
	}
}
