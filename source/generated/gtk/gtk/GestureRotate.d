module gtk.GestureRotate;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gobject.Signals;
private import gtk.Gesture;
private import gtk.c.functions;
public  import gtk.c.types;
private import std.algorithm;


/**
 * `GtkGestureRotate` is a `GtkGesture` for 2-finger rotations.
 * 
 * Whenever the angle between both handled sequences changes, the
 * [signal@Gtk.GestureRotate::angle-changed] signal is emitted.
 */
public class GestureRotate : Gesture
{
	/** the main Gtk struct */
	protected GtkGestureRotate* gtkGestureRotate;

	/** Get the main Gtk struct */
	public GtkGestureRotate* getGestureRotateStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkGestureRotate;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkGestureRotate;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkGestureRotate* gtkGestureRotate, bool ownedRef = false)
	{
		this.gtkGestureRotate = gtkGestureRotate;
		super(cast(GtkGesture*)gtkGestureRotate, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_gesture_rotate_get_type();
	}

	/**
	 * Returns a newly created `GtkGesture` that recognizes 2-touch
	 * rotation gestures.
	 *
	 * Returns: a newly created `GtkGestureRotate`
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gtk_gesture_rotate_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkGestureRotate*) __p, true);
	}

	/**
	 * Gets the angle delta in radians.
	 *
	 * If @gesture is active, this function returns the angle difference
	 * in radians since the gesture was first recognized. If @gesture is
	 * not active, 0 is returned.
	 *
	 * Returns: the angle delta in radians
	 */
	public double getAngleDelta()
	{
		return gtk_gesture_rotate_get_angle_delta(gtkGestureRotate);
	}

	/**
	 * Emitted when the angle between both tracked points changes.
	 *
	 * Params:
	 *     angle = Current angle in radians
	 *     angleDelta = Difference with the starting angle, in radians
	 */
	gulong addOnAngleChanged(void delegate(double, double, GestureRotate) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "angle-changed", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}