module gdk.GLContext;

private import gdk.Display;
private import gdk.DrawContext;
private import gdk.Surface;
private import gdk.c.functions;
public  import gdk.c.types;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;


/**
 * `GdkGLContext` is an object representing a platform-specific
 * OpenGL draw context.
 * 
 * `GdkGLContext`s are created for a surface using
 * [method@Gdk.Surface.create_gl_context], and the context will match
 * the the characteristics of the surface.
 * 
 * A `GdkGLContext` is not tied to any particular normal framebuffer.
 * For instance, it cannot draw to the surface back buffer. The GDK
 * repaint system is in full control of the painting to that. Instead,
 * you can create render buffers or textures and use [func@cairo_draw_from_gl]
 * in the draw function of your widget to draw them. Then GDK will handle
 * the integration of your rendering with that of other widgets.
 * 
 * Support for `GdkGLContext` is platform-specific and context creation
 * can fail, returning %NULL context.
 * 
 * A `GdkGLContext` has to be made "current" in order to start using
 * it, otherwise any OpenGL call will be ignored.
 * 
 * ## Creating a new OpenGL context
 * 
 * In order to create a new `GdkGLContext` instance you need a `GdkSurface`,
 * which you typically get during the realize call of a widget.
 * 
 * A `GdkGLContext` is not realized until either [method@Gdk.GLContext.make_current]
 * or [method@Gdk.GLContext.realize] is called. It is possible to specify
 * details of the GL context like the OpenGL version to be used, or whether
 * the GL context should have extra state validation enabled after calling
 * [method@Gdk.Surface.create_gl_context] by calling [method@Gdk.GLContext.realize].
 * If the realization fails you have the option to change the settings of
 * the `GdkGLContext` and try again.
 * 
 * ## Using a GdkGLContext
 * 
 * You will need to make the `GdkGLContext` the current context before issuing
 * OpenGL calls; the system sends OpenGL commands to whichever context is current.
 * It is possible to have multiple contexts, so you always need to ensure that
 * the one which you want to draw with is the current one before issuing commands:
 * 
 * ```c
 * gdk_gl_context_make_current (context);
 * ```
 * 
 * You can now perform your drawing using OpenGL commands.
 * 
 * You can check which `GdkGLContext` is the current one by using
 * [func@Gdk.GLContext.get_current]; you can also unset any `GdkGLContext`
 * that is currently set by calling [func@Gdk.GLContext.clear_current].
 */
public class GLContext : DrawContext
{
	/** the main Gtk struct */
	protected GdkGLContext* gdkGLContext;

	/** Get the main Gtk struct */
	public GdkGLContext* getGLContextStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gdkGLContext;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gdkGLContext;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GdkGLContext* gdkGLContext, bool ownedRef = false)
	{
		this.gdkGLContext = gdkGLContext;
		super(cast(GdkDrawContext*)gdkGLContext, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gdk_gl_context_get_type();
	}

	/**
	 * Clears the current `GdkGLContext`.
	 *
	 * Any OpenGL call after this function returns will be ignored
	 * until [method@Gdk.GLContext.make_current] is called.
	 */
	public static void clearCurrent()
	{
		gdk_gl_context_clear_current();
	}

	/**
	 * Retrieves the current `GdkGLContext`.
	 *
	 * Returns: the current `GdkGLContext`, or %NULL
	 */
	public static GLContext getCurrent()
	{
		auto __p = gdk_gl_context_get_current();

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(GLContext)(cast(GdkGLContext*) __p);
	}

	/**
	 * Retrieves whether the context is doing extra validations and runtime checking.
	 *
	 * See [method@Gdk.GLContext.set_debug_enabled].
	 *
	 * Returns: %TRUE if debugging is enabled
	 */
	public bool getDebugEnabled()
	{
		return gdk_gl_context_get_debug_enabled(gdkGLContext) != 0;
	}

	/**
	 * Retrieves the display the @context is created for
	 *
	 * Returns: a `GdkDisplay` or %NULL
	 */
	public override Display getDisplay()
	{
		auto __p = gdk_gl_context_get_display(gdkGLContext);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Display)(cast(GdkDisplay*) __p);
	}

	/**
	 * Retrieves whether the context is forward-compatible.
	 *
	 * See [method@Gdk.GLContext.set_forward_compatible].
	 *
	 * Returns: %TRUE if the context should be forward-compatible
	 */
	public bool getForwardCompatible()
	{
		return gdk_gl_context_get_forward_compatible(gdkGLContext) != 0;
	}

	/**
	 * Retrieves required OpenGL version.
	 *
	 * See [method@Gdk.GLContext.set_required_version].
	 *
	 * Params:
	 *     major = return location for the major version to request
	 *     minor = return location for the minor version to request
	 */
	public void getRequiredVersion(out int major, out int minor)
	{
		gdk_gl_context_get_required_version(gdkGLContext, &major, &minor);
	}

	/**
	 * Retrieves the `GdkGLContext` that this @context share data with.
	 *
	 * Returns: a `GdkGLContext` or %NULL
	 */
	public GLContext getSharedContext()
	{
		auto __p = gdk_gl_context_get_shared_context(gdkGLContext);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(GLContext)(cast(GdkGLContext*) __p);
	}

	/**
	 * Retrieves the surface used by the @context.
	 *
	 * Returns: a `GdkSurface` or %NULL
	 */
	public override Surface getSurface()
	{
		auto __p = gdk_gl_context_get_surface(gdkGLContext);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Surface)(cast(GdkSurface*) __p);
	}

	/**
	 * Checks whether the @context is using an OpenGL or OpenGL ES profile.
	 *
	 * Returns: %TRUE if the `GdkGLContext` is using an OpenGL ES profile
	 */
	public bool getUseEs()
	{
		return gdk_gl_context_get_use_es(gdkGLContext) != 0;
	}

	/**
	 * Retrieves the OpenGL version of the @context.
	 *
	 * The @context must be realized prior to calling this function.
	 *
	 * Params:
	 *     major = return location for the major version
	 *     minor = return location for the minor version
	 */
	public void getVersion(out int major, out int minor)
	{
		gdk_gl_context_get_version(gdkGLContext, &major, &minor);
	}

	/**
	 * Whether the `GdkGLContext` is in legacy mode or not.
	 *
	 * The `GdkGLContext` must be realized before calling this function.
	 *
	 * When realizing a GL context, GDK will try to use the OpenGL 3.2 core
	 * profile; this profile removes all the OpenGL API that was deprecated
	 * prior to the 3.2 version of the specification. If the realization is
	 * successful, this function will return %FALSE.
	 *
	 * If the underlying OpenGL implementation does not support core profiles,
	 * GDK will fall back to a pre-3.2 compatibility profile, and this function
	 * will return %TRUE.
	 *
	 * You can use the value returned by this function to decide which kind
	 * of OpenGL API to use, or whether to do extension discovery, or what
	 * kind of shader programs to load.
	 *
	 * Returns: %TRUE if the GL context is in legacy mode
	 */
	public bool isLegacy()
	{
		return gdk_gl_context_is_legacy(gdkGLContext) != 0;
	}

	/**
	 * Makes the @context the current one.
	 */
	public void makeCurrent()
	{
		gdk_gl_context_make_current(gdkGLContext);
	}

	/**
	 * Realizes the given `GdkGLContext`.
	 *
	 * It is safe to call this function on a realized `GdkGLContext`.
	 *
	 * Returns: %TRUE if the context is realized
	 *
	 * Throws: GException on failure.
	 */
	public bool realize()
	{
		GError* err = null;

		auto __p = gdk_gl_context_realize(gdkGLContext, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return __p;
	}

	/**
	 * Sets whether the `GdkGLContext` should perform extra validations and
	 * runtime checking.
	 *
	 * This is useful during development, but has additional overhead.
	 *
	 * The `GdkGLContext` must not be realized or made current prior to
	 * calling this function.
	 *
	 * Params:
	 *     enabled = whether to enable debugging in the context
	 */
	public void setDebugEnabled(bool enabled)
	{
		gdk_gl_context_set_debug_enabled(gdkGLContext, enabled);
	}

	/**
	 * Sets whether the `GdkGLContext` should be forward-compatible.
	 *
	 * Forward-compatible contexts must not support OpenGL functionality that
	 * has been marked as deprecated in the requested version; non-forward
	 * compatible contexts, on the other hand, must support both deprecated and
	 * non deprecated functionality.
	 *
	 * The `GdkGLContext` must not be realized or made current prior to calling
	 * this function.
	 *
	 * Params:
	 *     compatible = whether the context should be forward-compatible
	 */
	public void setForwardCompatible(bool compatible)
	{
		gdk_gl_context_set_forward_compatible(gdkGLContext, compatible);
	}

	/**
	 * Sets the major and minor version of OpenGL to request.
	 *
	 * Setting @major and @minor to zero will use the default values.
	 *
	 * The `GdkGLContext` must not be realized or made current prior to calling
	 * this function.
	 *
	 * Params:
	 *     major = the major version to request
	 *     minor = the minor version to request
	 */
	public void setRequiredVersion(int major, int minor)
	{
		gdk_gl_context_set_required_version(gdkGLContext, major, minor);
	}

	/**
	 * Requests that GDK create an OpenGL ES context instead of an OpenGL one.
	 *
	 * Not all platforms support OpenGL ES.
	 *
	 * The @context must not have been realized.
	 *
	 * By default, GDK will attempt to automatically detect whether the
	 * underlying GL implementation is OpenGL or OpenGL ES once the @context
	 * is realized.
	 *
	 * You should check the return value of [method@Gdk.GLContext.get_use_es]
	 * after calling [method@Gdk.GLContext.realize] to decide whether to use
	 * the OpenGL or OpenGL ES API, extensions, or shaders.
	 *
	 * Params:
	 *     useEs = whether the context should use OpenGL ES instead of OpenGL,
	 *         or -1 to allow auto-detection
	 */
	public void setUseEs(int useEs)
	{
		gdk_gl_context_set_use_es(gdkGLContext, useEs);
	}
}
